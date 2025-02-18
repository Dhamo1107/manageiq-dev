autoload(:ImageInspectorClient, 'image-inspector-client')
autoload(:Kubeclient, 'kubeclient')
autoload(:KubeException, 'kubeclient')

class ManageIQ::Providers::Kubernetes::ContainerManager::Scanning::Job < Job
  require_nested :Dispatcher

  PROVIDER_CLASS = ManageIQ::Providers::Kubernetes::ContainerManager
  INSPECTOR_IMAGE_TAG = '2.1'.freeze
  INSPECTOR_PORT = 8080
  DOCKER_SOCKET = '/var/run/docker.sock'
  SCAN_CATEGORIES = %w(system software)
  POD_POLL_INTERVAL = 10
  IMAGES_GUEST_OS = 'Linux'
  INSPECTOR_HEALTH_PATH = '/healthz'
  ERRCODE_NOTFOUND = 404
  IMAGE_INSPECTOR_SA = 'inspector-admin'
  INSPECTOR_ADMIN_SECRET_PATH = '/var/run/secrets/kubernetes.io/inspector-admin-secret-'
  PROXY_ENV_VARIABLES = %w(no_proxy http_proxy https_proxy)

  def load_transitions
    self.state ||= 'initializing'
    {
      :initializing => {'initializing'     => 'waiting_to_start'},
      :start        => {'waiting_to_start' => 'pod_create'},
      :pod_wait     => {'pod_create'       => 'waiting_to_scan',
                        'waiting_to_scan'  => 'waiting_to_scan'},
      :analyze      => {'waiting_to_scan'  => 'scanning'},
      :data         => {'scanning'      => 'synchronizing',
                        'synchronizing' => 'synchronizing'},
      :cleanup      => {'synchronizing'    => 'pod_delete'},
      :abort_job    => {'*'                => 'aborting'},
      :cancel_job   => {'*'                => 'canceling'},
      :cancel       => {'*'                => 'canceling'},
      :finish       => {'*'                => 'finishing'},
      :done         => {'pod_delete' => 'finished',
                        'aborting'   => 'finished',
                        'canceling'  => 'finished',
                        'finishing'  => 'finished'}
    }
  end

  def initializing
    # exactly like job.dispatch_start except for storage bits
    _log.info "Dispatch Status is 'pending'"
    update(:dispatch_status => "pending")
  end

  def start
    image = target_entity
    return queue_signal(:abort_job, "no image found", "error") unless image
    return queue_signal(:abort_job, "cannot analyze non docker images", "error") unless image.docker_id

    namespace = ::Settings.ems.ems_kubernetes.miq_namespace

    update!(:options => options.merge(
      :docker_image_id => image.docker_id,
      :image_full_name => image.full_name,
      :image_name      => image.name,
      :pod_name        => "manageiq-img-scan-#{guid[0..4]}",
      :pod_port        => INSPECTOR_PORT,
      :pod_namespace   => namespace
    ))

    _log.info("Getting inspector-admin secret for pod [#{pod_full_name}]")
    begin
      inspector_admin_secret_names = inspector_admin_secrets
    rescue SocketError, KubeException => e
      msg = "getting inspector-admin secret failed"
      _log.error("#{msg}: [#{e}]")
      return queue_signal(:abort_job, msg, "error")
    end

    pod = pod_definition(inspector_admin_secret_names)

    _log.info("Creating pod [#{pod_full_name}] to analyze docker image [#{options[:docker_image_id]}] [#{pod.to_json}]")
    begin
      kubernetes_client.create_pod(pod)
    rescue SocketError, KubeException => e
      msg = "pod creation for [#{pod_full_name}] failed"
      _log.error("#{msg}: [#{e}]")
      return queue_signal(:abort_job, msg, "error")
    end

    queue_signal(:pod_wait)
  end

  def poll_pod_wait
    queue_signal(:pod_wait, :deliver_on => POD_POLL_INTERVAL.seconds.from_now.utc)
  end

  def pod_wait
    _log.info("waiting for pod #{pod_full_name} to be available")

    begin
      statuses = kubernetes_client.get_pod(options[:pod_name], options[:pod_namespace])[:status].try(:containerStatuses)
      unless statuses
        _log.info("No containerStatuses for pod #{options[:pod_name]}")
        return poll_pod_wait
      end
      ready = statuses[0][:ready]
    rescue SocketError, KubeException => e
      msg = "unknown access error to pod #{pod_full_name}: [#{e.message}]"
      _log.info(msg)
      return queue_signal(:abort_job, msg, "error")
    end
    if ready
      _log.info("pod #{pod_full_name} is ready and accessible")
      return queue_signal(:analyze)
    else
      # continue: pod is still not up and running
      _log.info("pod #{pod_full_name} is not ready")
      return poll_pod_wait
    end
  end

  def verify_scanned_image_id(metadata)
    actual = metadata.Id
    return nil if actual == options[:docker_image_id]
    msg = "cannot analyze image %s with id %s: detected ids were %s" % [
      options[:image_full_name], options[:docker_image_id][0..11], actual[0..11]]

    if metadata.RepoDigests
      metadata.RepoDigests.each do |repo_digest|
        return nil if repo_digest == options[:docker_image_id]
        sha_digest = repo_digest.split('@').last
        return nil if sha_digest == options[:docker_image_id].split('@').last
        msg << ", #{sha_digest[0..11]}"
      end
    end

    msg
  end

  def analyze
    image = target_entity
    return queue_signal(:abort_job, "no image found", "error") unless image

    _log.info("scanning image #{options[:docker_image_id]}")

    scan_args = {
      :pod_namespace => options[:pod_namespace],
      :pod_name      => options[:pod_name],
      :pod_port      => options[:pod_port],
      :guest_os      => IMAGES_GUEST_OS
    }

    begin
      inspector_metadata = image_inspector_client.fetch_metadata
    rescue ImageInspectorClient::InspectorClientException => e
      msg = "analyzing image-inspector metadata for #{options[:docker_image_id]} failed with error: #{e}"
      _log.error(msg)
      return queue_signal(:abort_job, msg, 'error')
    end

    if inspector_metadata.ImageAcquireError.present?
      msg = "image acquiring error: #{inspector_metadata.ImageAcquireError}"
      _log.error(msg)
      return queue_signal(:abort_job, msg, 'error')
    end

    verify_error = verify_scanned_image_id(inspector_metadata)
    if verify_error
      _log.error(verify_error)
      return queue_signal(:abort_job, verify_error, 'error')
    end

    if inspector_metadata.OpenSCAP.Status == 'Error'
      update!(:options => options.merge(:scan_status         => inspector_metadata.OpenSCAP.Status,
                                        :scan_result_message => inspector_metadata.OpenSCAP.ErrorMessage))
    else
      collect_compliance_data(image)
    end

    image.scan_metadata(SCAN_CATEGORIES,
                        "taskid" => jobid,
                        "host"   => MiqServer.my_server,
                        "args"   => [YAML.dump(scan_args)])
  end

  def collect_compliance_data(image)
    unless OpenscapResult.openscap_available?
      _log.warn("OpenSCAP Binary missing, skipping scan")
      return nil
    end
    _log.info "collecting compliance data for #{options[:docker_image_id]}"
    openscap_result = image.openscap_result || OpenscapResult.new(:container_image => image)
    openscap_result.attach_raw_result(image_inspector_client.fetch_oscap_arf)
    openscap_result.save
  rescue ImageInspectorClient::InspectorClientException => e
    _log.error("collecting compliance data for #{options[:docker_image_id]} with error: #{e}")
  end

  def synchronize
    image = target_entity
    return queue_signal(:abort_job, "no image found", "error") unless image

    image.sync_metadata(SCAN_CATEGORIES,
                        "taskid" => jobid,
                        "host"   => MiqServer.my_server)
  end

  def data(payload)
    payload_document = MiqXml.load(payload)

    if payload_document.root.name.downcase == "summary"
      case operation = payload_document.root.first.name.downcase
      when "scanmetadata" then synchronize
      when "syncmetadata" then queue_signal(:cleanup)
      else raise "Unknown operation #{operation}"
      end
    end
  end

  def delete_pod
    return if options[:pod_name].blank?
    client = kubernetes_client

    begin
      pod = client.get_pod(options[:pod_name], options[:pod_namespace])
    rescue KubeException => e
      if e.error_code == ERRCODE_NOTFOUND
        _log.info("pod #{pod_full_name} not found, skipping delete")
        return
      end
      # TODO: handle the cleanup at a later time
      raise
    end

    pod_jobid = pod.metadata.annotations['manageiq.org/jobid']

    # If the job id is not matching the pod was not created by this
    # job and ManageIQ instance.
    if pod_jobid != jobid
      _log.info("skipping delete for pod #{pod_full_name} with " \
                "job id #{pod_jobid}")
    else
      _log.info("deleting pod #{pod_full_name}")
      begin
        client.delete_pod(options[:pod_name], options[:pod_namespace])
      rescue SocketError, KubeException => e
        _log.info("pod #{pod_full_name} deletion failed: #{e}")
        # TODO: handle the cleanup at a later time
      end
    end
  end

  def cleanup(*args)
    unqueue_all_signals
    image = target_entity
    raise_image_scan_event(image) if image

    delete_pod

    set_image_scan_status unless %w(aborting canceling finishing).include?(self.state)
  ensure
    case self.state
    when 'aborting', 'canceling', 'finishing' then message, status = message_status(*args)
    else
      message = target_entity.last_scan_result.scan_result_message
      status = target_entity.last_scan_result.scan_status
    end
    queue_signal(:done, message, status)
  end

  def raise_image_scan_event(image)
    suffix = %w(aborting canceling).include?(state) ? 'abort' : 'complete'
    MiqEvent.raise_evm_job_event(image, :type => "scan", :suffix => suffix)
  end

  def set_image_scan_status
    return unless target_entity
    target_entity.update(
      :last_scan_result => ScanResult.create(
        :scan_type           => "OpenSCAP",
        :scan_status         => options[:scan_status] == 'Error' ? 'warn' : 'ok',
        :scan_result_message => if options[:scan_status] == 'Error'
                                  options[:scan_result_message]
                                else
                                  'image analysis completed successfully'.freeze
                                end
      )
    )
  end

  def done(*args)
    # exactly like job.dispatch_finish except for storage bits
    _log.info "Dispatch Status is 'finished'"
    update(:dispatch_status => "finished")
    process_finished(*args)
  end

  alias_method :abort_job, :cleanup

  def cancel(*_args)
    _log.info "Job Canceling"
    if self.state != "canceling" # ensure change of states
      signal :cancel
    else
      signal :cancel_job
    end
  end
  alias_method :cancel_job, :cleanup
  alias_method :finish, :cleanup

  def queue_callback(state, msg, _)
    if state == "timeout" && self.state != "aborting"
      queue_signal(:abort_job, "Job Timeout: #{msg}", "error")
    end
  end

  def self.current_job_timeout(timeout_adjustment = 1)
    ::Settings.container_scanning.scanning_job_timeout.to_f_with_method * timeout_adjustment
  end

  private

  def message_status(*args)
    message, status = args
    message = message.to_s.empty? ? "Job interrupted" : message
    status = status.to_s.empty? ? "ok" : status
    return message, status
  end

  def ext_management_system
    @ext_management_system ||= ExtManagementSystem.find(options[:ems_id])
  end

  def kubernetes_client
    ext_management_system.connect(:service => PROVIDER_CLASS.ems_type)
  end

  def image_inspector_client
    kubeclient = kubernetes_client

    ImageInspectorClient::Client.new(
      pod_proxy_url(kubeclient, ''),
      'v1',
      :ssl_options    => {
        :verify_ssl => ext_management_system.verify_ssl_mode,
        :cert_store => ext_management_system.ssl_cert_store
      },
      :auth_options   => kubeclient.auth_options,
      :http_proxy_uri => kubeclient.http_proxy_uri
    )
  end

  def queue_options
    {
      :class_name  => "Job",
      :instance_id => id,
      :method_name => "signal",
      :priority    => MiqQueue::HIGH_PRIORITY,
      :role        => "smartstate",
      :task_id     => guid,
      :zone        => zone
    }
  end

  def unqueue_all_signals
    MiqQueue.unqueue(queue_options)
  end

  def queue_signal(*args, deliver_on: nil)
    MiqQueue.put_unless_exists(**queue_options, :args => args, :deliver_on => deliver_on) do |_msg, find_options|
      find_options.merge(
        :miq_callback => {
          :class_name  => self.class.to_s,
          :instance_id => id,
          :method_name => :queue_callback
        }
      )
    end
  end

  def pod_proxy_url(client, path = "")
    # TODO: change proxy_url in kubeclient to return URI
    pod_proxy = client.proxy_url(:pod,
                                 options[:pod_name],
                                 options[:pod_port],
                                 options[:pod_namespace])
    URI.parse(pod_proxy + path)
  end

  def pod_full_name
    "#{options[:pod_namespace]}/#{options[:pod_name]}"
  end

  def inspector_admin_secrets
    kubeclient = kubernetes_client
    begin
      inspector_sa = kubeclient.get_service_account(IMAGE_INSPECTOR_SA, options[:pod_namespace])
      return inspector_sa.try(:imagePullSecrets).to_a.collect { |sec| sec.try(:name) }.compact.uniq
    rescue KubeException => e
      raise e unless e.error_code == ERRCODE_NOTFOUND
      _log.warn("Service Account #{IMAGE_INSPECTOR_SA} does not exist.")
    end
    return nil
  end

  def ems_image_inspector_options
    @provider_options ||= ext_management_system.options.try(:fetch_path, :image_inspector_options) || {}
  end

  def pod_definition(inspector_admin_secret_names)
    pod_def = {
      :apiVersion => "v1",
      :kind       => "Pod",
      :metadata   => {
        :name        => options[:pod_name],
        :namespace   => options[:pod_namespace],
        :labels      => {
          'name'         => options[:pod_name],
          'manageiq.org' => "true"
        },
        :annotations => {
          # in case hostname is not set and options[:miq_server_host] is nil, change ""
          'manageiq.org/hostname' => options[:miq_server_host] || "unknown",
          'manageiq.org/guid'     => options[:miq_server_guid],
          'manageiq.org/image'    => options[:image_full_name],
          'manageiq.org/jobid'    => jobid,
        }
      },
      :spec       => {
        # A hack to smuggle at least partial info which image was scanned into the
        # OpenSCAP report - determines the "target name" in the report.
        # Must be lowercase and valid DNS RFC-1123 label up to 63 chars or kubernetes
        # won't run the pod.
        :hostname      => options[:image_name].match(/(?:.*\/)*(.*)$/).captures[0]
                                              .downcase.tr("^a-z0-9", "").truncate(63, :omission => ""),
        :restartPolicy => 'Never',
        :containers    => [
          {
            :name            => "image-inspector",
            :image           => inspector_image,
            :imagePullPolicy => "Always",
            :command         => [
              "/usr/bin/image-inspector",
              "--chroot",
              "--image=#{options[:image_full_name]}",
              "--scan-type=openscap",
              "--serve=0.0.0.0:#{options[:pod_port]}"
            ],
            :ports           => [{:containerPort => options[:pod_port]}],
            :securityContext => {:privileged =>  true},
            :volumeMounts    => [
              {
                :mountPath => DOCKER_SOCKET,
                :name      => "docker-socket"
              }
            ],
            :env             => inspector_proxy_env_variables,
            :readinessProbe  => {
              "initialDelaySeconds" => 15,
              "periodSeconds"       => 5,
              "httpGet"             => {
                "path" => "/healthz",
                "port" => options[:pod_port]
              }
            }
          }
        ],
        :volumes       => [
          {
            :name     => "docker-socket",
            :hostPath => {:path => DOCKER_SOCKET}
          }
        ]
      }
    }

    inspector_admin_secret_names.each do |secret_name|
      add_secret_to_pod_def(pod_def, secret_name)
    end
    add_cve_url(pod_def)
    Kubeclient::Resource.new(pod_def)
  end

  def add_secret_to_pod_def(pod_def, secret_name)
    pod_def[:spec][:containers][0][:command].append("--dockercfg=" + INSPECTOR_ADMIN_SECRET_PATH +
                                                    secret_name + "/.dockercfg")
    pod_def[:spec][:containers][0][:volumeMounts].append(
      :name      => "inspector-admin-secret-" + secret_name,
      :mountPath => INSPECTOR_ADMIN_SECRET_PATH + secret_name,
      :readOnly  => true)
    pod_def[:spec][:volumes].append(
      :name   => "inspector-admin-secret-" + secret_name,
      :secret => {:secretName => secret_name})
  end

  def inspector_image
    registry = ems_image_inspector_options.fetch_path(:registry) || ::Settings.ems.ems_kubernetes.image_inspector_registry
    repo = ems_image_inspector_options.fetch_path(:repository) || ::Settings.ems.ems_kubernetes.image_inspector_repository
    tag = ems_image_inspector_options.fetch_path(:image_tag) || INSPECTOR_IMAGE_TAG
    "#{registry}/#{repo}:#{tag}"
  end

  def inspector_proxy_env_variables
    PROXY_ENV_VARIABLES.each_with_object([]) do |var_name, env|
      next unless ems_image_inspector_options.key?(var_name.to_sym)
      var_value = ems_image_inspector_options[var_name.to_sym]
      env << {:name  => var_name.upcase,
              :value => var_value}
    end
  end

  def add_cve_url(pod_def)
    cve_url = ems_image_inspector_options.fetch_path(:cve_url) || ::Settings.ems.ems_kubernetes.image_inspector_cve_url
    pod_def[:spec][:containers][0][:command].append("--cve-url=#{cve_url}") unless cve_url.blank?
  end
end
