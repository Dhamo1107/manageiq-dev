# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2017_03_30
  #
  # The Microsoft Azure Network management API provides a RESTful set of web
  # services that interact with Microsoft Azure Networks service to manage your
  # network resources. The API has entities that capture the relationship
  # between an end user and the Microsoft Azure Networks service.
  #
  class PublicIPAddresses
    include MsRestAzure

    #
    # Creates and initializes a new instance of the PublicIPAddresses class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [NetworkManagementClient] reference to the NetworkManagementClient
    attr_reader :client

    #
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<PublicIPAddress>] operation results.
    #
    def list_virtual_machine_scale_set_public_ipaddresses(resource_group_name, virtual_machine_scale_set_name, custom_headers:nil)
      first_page = list_virtual_machine_scale_set_public_ipaddresses_as_lazy(resource_group_name, virtual_machine_scale_set_name, custom_headers:custom_headers)
      first_page.get_all_items
    end

    #
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_with_http_info(resource_group_name, virtual_machine_scale_set_name, custom_headers:nil)
      list_virtual_machine_scale_set_public_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, custom_headers:custom_headers).value!
    end

    #
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'virtual_machine_scale_set_name is nil' if virtual_machine_scale_set_name.nil?
      @client.api_version = '2017-03-30'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachineScaleSets/{virtualMachineScaleSetName}/publicipaddresses'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'virtualMachineScaleSetName' => virtual_machine_scale_set_name,'subscriptionId' => @client.subscription_id},
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
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Network::Mgmt::V2017_03_30::Models::PublicIPAddressListResult.mapper()
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
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The network interface name.
    # @param ip_configuration_name [String] The IP configuration name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<PublicIPAddress>] operation results.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:nil)
      first_page = list_virtual_machine_scale_set_vmpublic_ipaddresses_as_lazy(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:custom_headers)
      first_page.get_all_items
    end

    #
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The network interface name.
    # @param ip_configuration_name [String] The IP configuration name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_with_http_info(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:nil)
      list_virtual_machine_scale_set_vmpublic_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:custom_headers).value!
    end

    #
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The network interface name.
    # @param ip_configuration_name [String] The IP configuration name.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'virtual_machine_scale_set_name is nil' if virtual_machine_scale_set_name.nil?
      fail ArgumentError, 'virtualmachine_index is nil' if virtualmachine_index.nil?
      fail ArgumentError, 'network_interface_name is nil' if network_interface_name.nil?
      fail ArgumentError, 'ip_configuration_name is nil' if ip_configuration_name.nil?
      @client.api_version = '2017-03-30'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachineScaleSets/{virtualMachineScaleSetName}/virtualMachines/{virtualmachineIndex}/networkInterfaces/{networkInterfaceName}/ipconfigurations/{ipConfigurationName}/publicipaddresses'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'virtualMachineScaleSetName' => virtual_machine_scale_set_name,'virtualmachineIndex' => virtualmachine_index,'networkInterfaceName' => network_interface_name,'ipConfigurationName' => ip_configuration_name,'subscriptionId' => @client.subscription_id},
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
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Network::Mgmt::V2017_03_30::Models::PublicIPAddressListResult.mapper()
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
    # Get the specified public IP address in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The name of the network interface.
    # @param ip_configuration_name [String] The name of the IP configuration.
    # @param public_ip_address_name [String] The name of the public IP Address.
    # @param expand [String] Expands referenced resources.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PublicIPAddress] operation results.
    #
    def get_virtual_machine_scale_set_public_ipaddress(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, public_ip_address_name, expand:nil, custom_headers:nil)
      response = get_virtual_machine_scale_set_public_ipaddress_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, public_ip_address_name, expand:expand, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get the specified public IP address in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The name of the network interface.
    # @param ip_configuration_name [String] The name of the IP configuration.
    # @param public_ip_address_name [String] The name of the public IP Address.
    # @param expand [String] Expands referenced resources.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_virtual_machine_scale_set_public_ipaddress_with_http_info(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, public_ip_address_name, expand:nil, custom_headers:nil)
      get_virtual_machine_scale_set_public_ipaddress_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, public_ip_address_name, expand:expand, custom_headers:custom_headers).value!
    end

    #
    # Get the specified public IP address in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The name of the network interface.
    # @param ip_configuration_name [String] The name of the IP configuration.
    # @param public_ip_address_name [String] The name of the public IP Address.
    # @param expand [String] Expands referenced resources.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_virtual_machine_scale_set_public_ipaddress_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, public_ip_address_name, expand:nil, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'virtual_machine_scale_set_name is nil' if virtual_machine_scale_set_name.nil?
      fail ArgumentError, 'virtualmachine_index is nil' if virtualmachine_index.nil?
      fail ArgumentError, 'network_interface_name is nil' if network_interface_name.nil?
      fail ArgumentError, 'ip_configuration_name is nil' if ip_configuration_name.nil?
      fail ArgumentError, 'public_ip_address_name is nil' if public_ip_address_name.nil?
      @client.api_version = '2017-03-30'
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/virtualMachineScaleSets/{virtualMachineScaleSetName}/virtualMachines/{virtualmachineIndex}/networkInterfaces/{networkInterfaceName}/ipconfigurations/{ipConfigurationName}/publicipaddresses/{publicIpAddressName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'virtualMachineScaleSetName' => virtual_machine_scale_set_name,'virtualmachineIndex' => virtualmachine_index,'networkInterfaceName' => network_interface_name,'ipConfigurationName' => ip_configuration_name,'publicIpAddressName' => public_ip_address_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version,'$expand' => expand},
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
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Network::Mgmt::V2017_03_30::Models::PublicIPAddress.mapper()
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
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PublicIPAddressListResult] operation results.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_next(next_page_link, custom_headers:nil)
      response = list_virtual_machine_scale_set_public_ipaddresses_next_async(next_page_link, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_next_with_http_info(next_page_link, custom_headers:nil)
      list_virtual_machine_scale_set_public_ipaddresses_next_async(next_page_link, custom_headers:custom_headers).value!
    end

    #
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_next_async(next_page_link, custom_headers:nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
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
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Network::Mgmt::V2017_03_30::Models::PublicIPAddressListResult.mapper()
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
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PublicIPAddressListResult] operation results.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_next(next_page_link, custom_headers:nil)
      response = list_virtual_machine_scale_set_vmpublic_ipaddresses_next_async(next_page_link, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_next_with_http_info(next_page_link, custom_headers:nil)
      list_virtual_machine_scale_set_vmpublic_ipaddresses_next_async(next_page_link, custom_headers:custom_headers).value!
    end

    #
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param next_page_link [String] The NextLink from the previous successful call
    # to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_next_async(next_page_link, custom_headers:nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
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
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Network::Mgmt::V2017_03_30::Models::PublicIPAddressListResult.mapper()
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
    # Gets information about all public IP addresses on a virtual machine scale set
    # level.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PublicIPAddressListResult] which provide lazy access to pages of the
    # response.
    #
    def list_virtual_machine_scale_set_public_ipaddresses_as_lazy(resource_group_name, virtual_machine_scale_set_name, custom_headers:nil)
      response = list_virtual_machine_scale_set_public_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, custom_headers:custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_virtual_machine_scale_set_public_ipaddresses_next_async(next_page_link, custom_headers:custom_headers)
        end
        page
      end
    end

    #
    # Gets information about all public IP addresses in a virtual machine IP
    # configuration in a virtual machine scale set.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param virtual_machine_scale_set_name [String] The name of the virtual
    # machine scale set.
    # @param virtualmachine_index [String] The virtual machine index.
    # @param network_interface_name [String] The network interface name.
    # @param ip_configuration_name [String] The IP configuration name.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [PublicIPAddressListResult] which provide lazy access to pages of the
    # response.
    #
    def list_virtual_machine_scale_set_vmpublic_ipaddresses_as_lazy(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:nil)
      response = list_virtual_machine_scale_set_vmpublic_ipaddresses_async(resource_group_name, virtual_machine_scale_set_name, virtualmachine_index, network_interface_name, ip_configuration_name, custom_headers:custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_virtual_machine_scale_set_vmpublic_ipaddresses_next_async(next_page_link, custom_headers:custom_headers)
        end
        page
      end
    end

  end
end
