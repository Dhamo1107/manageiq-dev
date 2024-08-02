# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2017_12_01_preview
  #
  # Monitor Management Client
  #
  class MetricNamespaces
    include MsRestAzure

    #
    # Creates and initializes a new instance of the MetricNamespaces class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [MonitorManagementClient] reference to the MonitorManagementClient
    attr_reader :client

    #
    # Lists the metric namespaces for the resource.
    #
    # @param resource_uri [String] The identifier of the resource.
    # @param start_time [String] The ISO 8601 conform Date start time from which to
    # query for metric namespaces.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MetricNamespaceCollection] operation results.
    #
    def list(resource_uri, start_time:nil, custom_headers:nil)
      response = list_async(resource_uri, start_time:start_time, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Lists the metric namespaces for the resource.
    #
    # @param resource_uri [String] The identifier of the resource.
    # @param start_time [String] The ISO 8601 conform Date start time from which to
    # query for metric namespaces.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(resource_uri, start_time:nil, custom_headers:nil)
      list_async(resource_uri, start_time:start_time, custom_headers:custom_headers).value!
    end

    #
    # Lists the metric namespaces for the resource.
    #
    # @param resource_uri [String] The identifier of the resource.
    # @param start_time [String] The ISO 8601 conform Date start time from which to
    # query for metric namespaces.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(resource_uri, start_time:nil, custom_headers:nil)
      fail ArgumentError, 'resource_uri is nil' if resource_uri.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{resourceUri}/providers/microsoft.insights/metricNamespaces'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'resourceUri' => resource_uri},
          query_params: {'api-version' => @client.api_version,'startTime' => start_time},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2017_12_01_preview::Models::MetricNamespaceCollection.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
