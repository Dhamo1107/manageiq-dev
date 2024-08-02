=begin
#Power Cloud API

#IBM Power Cloud API for Power Hardware / Infrastructure

The version of the OpenAPI document: 1.0.0
Contact: kylej@us.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module IbmCloudPower
  class PCloudVolumeOnboardingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get the information of volume onboarding operation
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param volume_onboarding_id [String] Indicates volume onboarding operation id
    # @param [Hash] opts the optional parameters
    # @return [VolumeOnboarding]
    def pcloud_volume_onboarding_get(cloud_instance_id, volume_onboarding_id, opts = {})
      data, _status_code, _headers = pcloud_volume_onboarding_get_with_http_info(cloud_instance_id, volume_onboarding_id, opts)
      data
    end

    # Get the information of volume onboarding operation
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param volume_onboarding_id [String] Indicates volume onboarding operation id
    # @param [Hash] opts the optional parameters
    # @return [Array<(VolumeOnboarding, Integer, Hash)>] VolumeOnboarding data, response status code and response headers
    def pcloud_volume_onboarding_get_with_http_info(cloud_instance_id, volume_onboarding_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PCloudVolumeOnboardingApi.pcloud_volume_onboarding_get ...'
      end
      # verify the required parameter 'cloud_instance_id' is set
      if @api_client.config.client_side_validation && cloud_instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'cloud_instance_id' when calling PCloudVolumeOnboardingApi.pcloud_volume_onboarding_get"
      end
      # verify the required parameter 'volume_onboarding_id' is set
      if @api_client.config.client_side_validation && volume_onboarding_id.nil?
        fail ArgumentError, "Missing the required parameter 'volume_onboarding_id' when calling PCloudVolumeOnboardingApi.pcloud_volume_onboarding_get"
      end
      # resource path
      local_var_path = '/pcloud/v1/cloud-instances/{cloud_instance_id}/volumes/onboarding/{volume_onboarding_id}'.sub('{' + 'cloud_instance_id' + '}', CGI.escape(cloud_instance_id.to_s)).sub('{' + 'volume_onboarding_id' + '}', CGI.escape(volume_onboarding_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'VolumeOnboarding'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PCloudVolumeOnboardingApi.pcloud_volume_onboarding_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PCloudVolumeOnboardingApi#pcloud_volume_onboarding_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List all volume onboardings for this cloud instance
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param [Hash] opts the optional parameters
    # @return [VolumeOnboardings]
    def pcloud_volume_onboarding_getall(cloud_instance_id, opts = {})
      data, _status_code, _headers = pcloud_volume_onboarding_getall_with_http_info(cloud_instance_id, opts)
      data
    end

    # List all volume onboardings for this cloud instance
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param [Hash] opts the optional parameters
    # @return [Array<(VolumeOnboardings, Integer, Hash)>] VolumeOnboardings data, response status code and response headers
    def pcloud_volume_onboarding_getall_with_http_info(cloud_instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PCloudVolumeOnboardingApi.pcloud_volume_onboarding_getall ...'
      end
      # verify the required parameter 'cloud_instance_id' is set
      if @api_client.config.client_side_validation && cloud_instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'cloud_instance_id' when calling PCloudVolumeOnboardingApi.pcloud_volume_onboarding_getall"
      end
      # resource path
      local_var_path = '/pcloud/v1/cloud-instances/{cloud_instance_id}/volumes/onboarding'.sub('{' + 'cloud_instance_id' + '}', CGI.escape(cloud_instance_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'VolumeOnboardings'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PCloudVolumeOnboardingApi.pcloud_volume_onboarding_getall",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PCloudVolumeOnboardingApi#pcloud_volume_onboarding_getall\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Onboard auxiliary volumes to target site
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param body [VolumeOnboardingCreate] Parameters for the creation of volume onboarding
    # @param [Hash] opts the optional parameters
    # @return [VolumeOnboardingCreateResponse]
    def pcloud_volume_onboarding_post(cloud_instance_id, body, opts = {})
      data, _status_code, _headers = pcloud_volume_onboarding_post_with_http_info(cloud_instance_id, body, opts)
      data
    end

    # Onboard auxiliary volumes to target site
    # @param cloud_instance_id [String] Cloud Instance ID of a PCloud Instance
    # @param body [VolumeOnboardingCreate] Parameters for the creation of volume onboarding
    # @param [Hash] opts the optional parameters
    # @return [Array<(VolumeOnboardingCreateResponse, Integer, Hash)>] VolumeOnboardingCreateResponse data, response status code and response headers
    def pcloud_volume_onboarding_post_with_http_info(cloud_instance_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PCloudVolumeOnboardingApi.pcloud_volume_onboarding_post ...'
      end
      # verify the required parameter 'cloud_instance_id' is set
      if @api_client.config.client_side_validation && cloud_instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'cloud_instance_id' when calling PCloudVolumeOnboardingApi.pcloud_volume_onboarding_post"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling PCloudVolumeOnboardingApi.pcloud_volume_onboarding_post"
      end
      # resource path
      local_var_path = '/pcloud/v1/cloud-instances/{cloud_instance_id}/volumes/onboarding'.sub('{' + 'cloud_instance_id' + '}', CGI.escape(cloud_instance_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'VolumeOnboardingCreateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"PCloudVolumeOnboardingApi.pcloud_volume_onboarding_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PCloudVolumeOnboardingApi#pcloud_volume_onboarding_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
