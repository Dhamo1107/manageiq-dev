class ManageIQ::Providers::Google::NetworkManager < ManageIQ::Providers::NetworkManager
  require_nested :CloudNetwork
  require_nested :CloudSubnet
  require_nested :FloatingIp
  require_nested :LoadBalancer
  require_nested :LoadBalancerHealthCheck
  require_nested :LoadBalancerListener
  require_nested :LoadBalancerPool
  require_nested :LoadBalancerPoolMember
  require_nested :NetworkPort
  require_nested :NetworkRouter
  require_nested :SecurityGroup

  include ManageIQ::Providers::Google::ManagerMixin

  # Auth and endpoints delegations, editing of this type of manager must be disabled
  delegate :authentication_check,
           :authentication_status,
           :authentication_status_ok?,
           :authentications,
           :authentication_for_summary,
           :zone,
           :connect,
           :verify_credentials,
           :with_provider_connection,
           :address,
           :ip_address,
           :hostname,
           :default_endpoint,
           :endpoints,
           :google_tenant_id,
           :refresh,
           :refresh_ems,
           :to        => :parent_manager,
           :allow_nil => true

  def self.ems_type
    @ems_type ||= "gce_network".freeze
  end

  def self.description
    @description ||= "Google Network".freeze
  end

  def self.hostname_required?
    false
  end

  def self.display_name(number = 1)
    n_('Network Provider (Google)', 'Network Providers (Google)', number)
  end
end
