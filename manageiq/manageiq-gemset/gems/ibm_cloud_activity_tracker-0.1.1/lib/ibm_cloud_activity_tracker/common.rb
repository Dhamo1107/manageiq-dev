# frozen_string_literal: true

require_relative "./version.rb"

module IbmCloudActivityTracker
  # SDK Common class
  class Common
    def initialize(*); end

    def get_sdk_headers(service_name, service_version, operation_id, service_key)
      headers = {}
      user_agent_string = "ibm_cloud_activity_tracker-ruby-sdk-" + IbmCloudActivityTracker::VERSION + " #{RbConfig::CONFIG["host"]}"
      user_agent_string += " #{RbConfig::CONFIG["RUBY_BASE_NAME"]}-#{RbConfig::CONFIG["RUBY_PROGRAM_VERSION"]}"

      headers["User-Agent"] = user_agent_string
      return headers if service_name.nil? || service_version.nil? || operation_id.nil?

      headers["servicekey"] = service_key

      headers["X-IBMCloud-SDK-Analytics"] = "service_name=#{service_name};service_version=#{service_version};operation_id=#{operation_id}"
      headers
    end
  end
end
