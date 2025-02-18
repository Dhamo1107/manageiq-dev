module ManageIQ::Providers::Vmware::InfraManager::VmOrTemplateShared::Scanning
  extend ActiveSupport::Concern

  included do
    supports :smartstate_analysis do
      feature_supported, reason = check_feature_support('smartstate_analysis')
      unless feature_supported
        unsupported_reason_add(:smartstate_analysis, reason)
      end
    end
  end

  def scan_job_class
    ManageIQ::Providers::Vmware::InfraManager::Scanning::Job
  end

  def perform_metadata_scan(ost)
    require 'MiqVm/MiqVm'
    require 'manageiq-smartstate'

    log_pref = "MIQ(#{self.class.name}##{__method__})"
    vm_name  = ManageIQ::Smartstate::Util.uri_to_local_path(ost.args[0])
    $log.debug "#{log_pref} VM = #{vm_name}"

    begin
      @vm_cfg_file = vm_name
      connect_to_ems(ost)
      ost.force = !self.template?
      miq_vm = MiqVm.new(@vm_cfg_file, ost) # TODO: Create VMware-specific MiqVm subclass
      scan_via_miq_vm(miq_vm, ost)
    rescue => err
      $log.error "#{log_pref}: #{err}"
      $log.debug err.backtrace.join("\n")
      raise
    ensure
      miq_vm.unmount if miq_vm
    end
  end

  def perform_metadata_sync(ost)
    sync_stashed_metadata(ost)
  end

  private

  # Moved from MIQExtract.rb
  def connect_to_ems(ost)
    $log.debug "connect_to_ems: ost.config && ost.config.capabilities[:vixDisk] = #{(ost.config && ost.config.capabilities[:vixDisk]).class.name}"
    if ost.config && ost.config.capabilities[:vixDisk] == true
      # Make sure we were given a ems/host to connect to
      ems_connect_type = ost.scanData.fetch_path('ems', 'connect_to') || 'host'
      $log.debug "connect_to_ems: ems_connect_type = #{ems_connect_type}"
      miqVimHost = ost.scanData.fetch_path("ems", ems_connect_type) # XXX What is this???
      $log.debug "connect_to_ems: miqVimHost = #{miqVimHost.class.name}"
      if miqVimHost
        st = Time.now
        # TODO remove use_broker completely
        use_broker = false
        host_address = miqVimHost[:hostname] || miqVimHost[:ipaddress]
        ems_display_text = "#{ems_connect_type}(#{use_broker ? 'via broker' : 'directly'}):#{miqVimHost[:address]}"
        $log.info "Connecting to [#{ems_display_text}] for VM:[#{@vmCfgFile}]"
        password_decrypt = ManageIQ::Password.decrypt(miqVimHost[:password])
        if !$miqHostCfg || !$miqHostCfg.emsLocal
          ($miqHostCfg ||= OpenStruct.new).vimHost = ost.scanData["ems"]['host']
          $miqHostCfg.vimHost[:use_vim_broker] = use_broker
        end

        begin
          require 'VMwareWebService/MiqVim'
          # TODO: Should this move to the EMS?
          ost.miqVim = MiqVim.new(:server => host_address, :username => miqVimHost[:username], :password => password_decrypt)
          # ost.snapId = opts.snapId if opts.snapId
          $log.info "Connection to [#{ems_display_text}] completed for VM:[#{@vmCfgFile}] in [#{Time.now - st}] seconds"
        rescue Timeout::Error => err
          msg = "Connection to [#{ems_display_text}] timed out for VM:[#{@vmCfgFile}] with error [#{err}] after [#{Time.now - st}] seconds"
          $log.error msg
          raise err, msg, err.backtrace
        rescue Exception => err
          msg = "Connection to [#{ems_display_text}] failed for VM:[#{@vmCfgFile}] with error [#{err}] after [#{Time.now - st}] seconds"
          $log.error msg
          raise err, msg, err.backtrace
        end
      end
    end
  end
end
