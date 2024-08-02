# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2018_06_17_preview
  #
  # Composite Swagger for Application Insights Management Client
  #
  class Workbooks
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Workbooks class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [ApplicationInsightsManagementClient] reference to the ApplicationInsightsManagementClient
    attr_reader :client

    #
    # Get all Workbooks defined within a specified resource group and category.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param category [CategoryType] Category of workbook to return. Possible
    # values include: 'workbook', 'TSG', 'performance', 'retention'
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param tags [Array<String>] Tags presents on each workbook returned.
    # @param can_fetch_content [Boolean] Flag indicating whether or not to return
    # the full content for each applicable workbook. If false, only return summary
    # content for workbooks.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [WorkbooksListResult] operation results.
    #
    def list_by_resource_group(resource_group_name, category, source_id, tags:nil, can_fetch_content:nil, custom_headers:nil)
      response = list_by_resource_group_async(resource_group_name, category, source_id, tags:tags, can_fetch_content:can_fetch_content, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get all Workbooks defined within a specified resource group and category.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param category [CategoryType] Category of workbook to return. Possible
    # values include: 'workbook', 'TSG', 'performance', 'retention'
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param tags [Array<String>] Tags presents on each workbook returned.
    # @param can_fetch_content [Boolean] Flag indicating whether or not to return
    # the full content for each applicable workbook. If false, only return summary
    # content for workbooks.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_by_resource_group_with_http_info(resource_group_name, category, source_id, tags:nil, can_fetch_content:nil, custom_headers:nil)
      list_by_resource_group_async(resource_group_name, category, source_id, tags:tags, can_fetch_content:can_fetch_content, custom_headers:custom_headers).value!
    end

    #
    # Get all Workbooks defined within a specified resource group and category.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param category [CategoryType] Category of workbook to return. Possible
    # values include: 'workbook', 'TSG', 'performance', 'retention'
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param tags [Array<String>] Tags presents on each workbook returned.
    # @param can_fetch_content [Boolean] Flag indicating whether or not to return
    # the full content for each applicable workbook. If false, only return summary
    # content for workbooks.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_by_resource_group_async(resource_group_name, category, source_id, tags:nil, can_fetch_content:nil, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, "'@client.subscription_id' should satisfy the constraint - 'MinLength': '1'" if !@client.subscription_id.nil? && @client.subscription_id.length < 1
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MaxLength': '90'" if !resource_group_name.nil? && resource_group_name.length > 90
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MinLength': '1'" if !resource_group_name.nil? && resource_group_name.length < 1
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'Pattern': '^[-\w\._\(\)]+$'" if !resource_group_name.nil? && resource_group_name.match(Regexp.new('^^[-\w\._\(\)]+$$')).nil?
      fail ArgumentError, 'category is nil' if category.nil?
      fail ArgumentError, 'source_id is nil' if source_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, "'@client.api_version' should satisfy the constraint - 'MinLength': '1'" if !@client.api_version.nil? && @client.api_version.length < 1


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/microsoft.insights/workbooks'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name},
          query_params: {'category' => category,'tags' => tags.nil? ? nil : tags.join(','),'sourceId' => source_id,'canFetchContent' => can_fetch_content,'api-version' => @client.api_version},
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
            result_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::WorkbooksListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get a single workbook by its resourceName.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Workbook] operation results.
    #
    def get(resource_group_name, resource_name, custom_headers:nil)
      response = get_async(resource_group_name, resource_name, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get a single workbook by its resourceName.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, resource_name, custom_headers:nil)
      get_async(resource_group_name, resource_name, custom_headers:custom_headers).value!
    end

    #
    # Get a single workbook by its resourceName.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, resource_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, "'@client.subscription_id' should satisfy the constraint - 'MinLength': '1'" if !@client.subscription_id.nil? && @client.subscription_id.length < 1
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MaxLength': '90'" if !resource_group_name.nil? && resource_group_name.length > 90
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MinLength': '1'" if !resource_group_name.nil? && resource_group_name.length < 1
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'Pattern': '^[-\w\._\(\)]+$'" if !resource_group_name.nil? && resource_group_name.match(Regexp.new('^^[-\w\._\(\)]+$$')).nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, "'@client.api_version' should satisfy the constraint - 'MinLength': '1'" if !@client.api_version.nil? && @client.api_version.length < 1


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/microsoft.insights/workbooks/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'resourceName' => resource_name},
          query_params: {'api-version' => @client.api_version},
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
            result_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::Workbook.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Delete a workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(resource_group_name, resource_name, custom_headers:nil)
      response = delete_async(resource_group_name, resource_name, custom_headers:custom_headers).value!
      nil
    end

    #
    # Delete a workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(resource_group_name, resource_name, custom_headers:nil)
      delete_async(resource_group_name, resource_name, custom_headers:custom_headers).value!
    end

    #
    # Delete a workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(resource_group_name, resource_name, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, "'@client.subscription_id' should satisfy the constraint - 'MinLength': '1'" if !@client.subscription_id.nil? && @client.subscription_id.length < 1
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MaxLength': '90'" if !resource_group_name.nil? && resource_group_name.length > 90
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MinLength': '1'" if !resource_group_name.nil? && resource_group_name.length < 1
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'Pattern': '^[-\w\._\(\)]+$'" if !resource_group_name.nil? && resource_group_name.match(Regexp.new('^^[-\w\._\(\)]+$$')).nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, "'@client.api_version' should satisfy the constraint - 'MinLength': '1'" if !@client.api_version.nil? && @client.api_version.length < 1


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/microsoft.insights/workbooks/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'resourceName' => resource_name},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 201 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Create a new workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_properties [Workbook] Properties that need to be specified to
    # create a new workbook.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Workbook] operation results.
    #
    def create_or_update(resource_group_name, resource_name, source_id, workbook_properties, custom_headers:nil)
      response = create_or_update_async(resource_group_name, resource_name, source_id, workbook_properties, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Create a new workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_properties [Workbook] Properties that need to be specified to
    # create a new workbook.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_or_update_with_http_info(resource_group_name, resource_name, source_id, workbook_properties, custom_headers:nil)
      create_or_update_async(resource_group_name, resource_name, source_id, workbook_properties, custom_headers:custom_headers).value!
    end

    #
    # Create a new workbook.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_properties [Workbook] Properties that need to be specified to
    # create a new workbook.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_or_update_async(resource_group_name, resource_name, source_id, workbook_properties, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, "'@client.subscription_id' should satisfy the constraint - 'MinLength': '1'" if !@client.subscription_id.nil? && @client.subscription_id.length < 1
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MaxLength': '90'" if !resource_group_name.nil? && resource_group_name.length > 90
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MinLength': '1'" if !resource_group_name.nil? && resource_group_name.length < 1
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'Pattern': '^[-\w\._\(\)]+$'" if !resource_group_name.nil? && resource_group_name.match(Regexp.new('^^[-\w\._\(\)]+$$')).nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'source_id is nil' if source_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, "'@client.api_version' should satisfy the constraint - 'MinLength': '1'" if !@client.api_version.nil? && @client.api_version.length < 1
      fail ArgumentError, 'workbook_properties is nil' if workbook_properties.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::Workbook.mapper()
      request_content = @client.serialize(request_mapper,  workbook_properties)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/microsoft.insights/workbooks/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'resourceName' => resource_name},
          query_params: {'sourceId' => source_id,'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201
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
            result_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::Workbook.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::Workbook.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Updates a workbook that has already been added.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_update_parameters [WorkbookUpdateParameters] Properties that
    # need to be specified to create a new workbook.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Workbook] operation results.
    #
    def update(resource_group_name, resource_name, source_id, workbook_update_parameters:nil, custom_headers:nil)
      response = update_async(resource_group_name, resource_name, source_id, workbook_update_parameters:workbook_update_parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Updates a workbook that has already been added.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_update_parameters [WorkbookUpdateParameters] Properties that
    # need to be specified to create a new workbook.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_with_http_info(resource_group_name, resource_name, source_id, workbook_update_parameters:nil, custom_headers:nil)
      update_async(resource_group_name, resource_name, source_id, workbook_update_parameters:workbook_update_parameters, custom_headers:custom_headers).value!
    end

    #
    # Updates a workbook that has already been added.
    #
    # @param resource_group_name [String] The name of the resource group. The name
    # is case insensitive.
    # @param resource_name [String] The name of the Application Insights component
    # resource.
    # @param source_id [String] Azure Resource Id that will fetch all related
    # workbooks.
    # @param workbook_update_parameters [WorkbookUpdateParameters] Properties that
    # need to be specified to create a new workbook.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_async(resource_group_name, resource_name, source_id, workbook_update_parameters:nil, custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, "'@client.subscription_id' should satisfy the constraint - 'MinLength': '1'" if !@client.subscription_id.nil? && @client.subscription_id.length < 1
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MaxLength': '90'" if !resource_group_name.nil? && resource_group_name.length > 90
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'MinLength': '1'" if !resource_group_name.nil? && resource_group_name.length < 1
      fail ArgumentError, "'resource_group_name' should satisfy the constraint - 'Pattern': '^[-\w\._\(\)]+$'" if !resource_group_name.nil? && resource_group_name.match(Regexp.new('^^[-\w\._\(\)]+$$')).nil?
      fail ArgumentError, 'resource_name is nil' if resource_name.nil?
      fail ArgumentError, 'source_id is nil' if source_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, "'@client.api_version' should satisfy the constraint - 'MinLength': '1'" if !@client.api_version.nil? && @client.api_version.length < 1


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::WorkbookUpdateParameters.mapper()
      request_content = @client.serialize(request_mapper,  workbook_update_parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/microsoft.insights/workbooks/{resourceName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'resourceGroupName' => resource_group_name,'resourceName' => resource_name},
          query_params: {'sourceId' => source_id,'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:patch, path_template, options)

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
            result_mapper = Azure::Monitor::Mgmt::V2018_06_17_preview::Models::Workbook.mapper()
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
