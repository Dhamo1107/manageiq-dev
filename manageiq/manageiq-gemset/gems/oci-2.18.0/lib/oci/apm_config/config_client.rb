# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Application Performance Monitoring Configuration API to query and set Application Performance Monitoring
  # configuration. For more information, see [Application Performance Monitoring](https://docs.oracle.com/iaas/application-performance-monitoring/index.html).
  class ApmConfig::ConfigClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The default retry configuration to apply to all operations in this service client. This can be overridden
    # on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    # will not perform any retries
    # @return [OCI::Retry::RetryConfig]
    attr_reader :retry_config

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity


    # Creates a new ConfigClient.
    # Notes:
    #   If a config is not specified, then the global OCI.config will be used.
    #
    #   This client is not thread-safe
    #
    #   Either a region or an endpoint must be specified.  If an endpoint is specified, it will be used instead of the
    #     region. A region may be specified in the config or via or the region parameter. If specified in both, then the
    #     region parameter will be used.
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint The fully qualified endpoint URL
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, endpoint: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner or SecurityTokenSigner and no config was supplied (they are self-sufficient signers)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config = OCI::Config.validate_and_build_config_with_signer(config, signer)

      signer = OCI::Signer.config_file_auth_builder(config) if signer.nil?

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/20210201'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ConfigClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://apm-config.{region}.oci.{secondLevelDomain}') + '/20210201'
      logger.info "ConfigClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new configuration item.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [OCI::ApmConfig::Models::CreateConfigDetails] create_config_details The configuration details of the new item.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_dry_run Indicates that the request is a dry run, if set to \"true\". A dry run request does not modify the
    #   configuration item details and is used only to perform validation on the submitted data.
    #    (default to false)
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::Config Config}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/create_config.rb.html) to see an example of how to use create_config API.
    def create_config(apm_domain_id, create_config_details, opts = {})
      logger.debug 'Calling operation ConfigClient#create_config.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling create_config." if apm_domain_id.nil?
      raise "Missing the required parameter 'create_config_details' when calling create_config." if create_config_details.nil?

      path = '/configs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-dry-run'] = opts[:opc_dry_run] if opts[:opc_dry_run]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_config_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#create_config') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::Config'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the configuration item identified by the OCID.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [String] config_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the configuration item.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/delete_config.rb.html) to see an example of how to use delete_config API.
    def delete_config(apm_domain_id, config_id, opts = {})
      logger.debug 'Calling operation ConfigClient#delete_config.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling delete_config." if apm_domain_id.nil?
      raise "Missing the required parameter 'config_id' when calling delete_config." if config_id.nil?
      raise "Parameter value for 'config_id' must not be blank" if OCI::Internal::Util.blank_string?(config_id)

      path = '/configs/{configId}'.sub('{configId}', config_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#delete_config') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the configuration item identified by the OCID.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [String] config_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the configuration item.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::Config Config}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/get_config.rb.html) to see an example of how to use get_config API.
    def get_config(apm_domain_id, config_id, opts = {})
      logger.debug 'Calling operation ConfigClient#get_config.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling get_config." if apm_domain_id.nil?
      raise "Missing the required parameter 'config_id' when calling get_config." if config_id.nil?
      raise "Parameter value for 'config_id' must not be blank" if OCI::Internal::Util.blank_string?(config_id)

      path = '/configs/{configId}'.sub('{configId}', config_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#get_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::Config'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns all configuration items, which can optionally be filtered by configuration type.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :config_type A filter to match configuration items of a given type.
    #   Supported values are SPAN_FILTER, METRIC_GROUP, and APDEX.
    #
    # @option opts [String] :display_name A filter to return resources that match the given display name.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page The maximum number of results per page, or items to return in a paginated \"List\" call. For information on
    #   how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The displayName sort order
    #   is case-sensitive.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. You can provide one \"sortBy\" value. The default order for displayName, timeCreated
    #   and timeUpdated is ascending. The displayName sort by is case-sensitive.
    #    (default to displayName)
    #   Allowed values are: displayName, timeCreated, timeUpdated
    # @option opts [String] :options_group A filter to return OPTIONS resources that match the given group.
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::ConfigCollection ConfigCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/list_configs.rb.html) to see an example of how to use list_configs API.
    def list_configs(apm_domain_id, opts = {})
      logger.debug 'Calling operation ConfigClient#list_configs.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling list_configs." if apm_domain_id.nil?

      if opts[:sort_order] && !OCI::ApmConfig::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApmConfig::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, timeUpdated.'
      end

      path = '/configs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:configType] = opts[:config_type] if opts[:config_type]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:optionsGroup] = opts[:options_group] if opts[:options_group]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#list_configs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::ConfigCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns all metrics associated with the specified namespace.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [OCI::ApmConfig::Models::RetrieveNamespaceMetricsDetails] retrieve_namespace_metrics_details The namespace to get the metrics for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::NamespaceMetricCollection NamespaceMetricCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/retrieve_namespace_metrics.rb.html) to see an example of how to use retrieve_namespace_metrics API.
    def retrieve_namespace_metrics(apm_domain_id, retrieve_namespace_metrics_details, opts = {})
      logger.debug 'Calling operation ConfigClient#retrieve_namespace_metrics.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling retrieve_namespace_metrics." if apm_domain_id.nil?
      raise "Missing the required parameter 'retrieve_namespace_metrics_details' when calling retrieve_namespace_metrics." if retrieve_namespace_metrics_details.nil?

      path = '/actions/retrieveNamespaceMetrics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(retrieve_namespace_metrics_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#retrieve_namespace_metrics') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::NamespaceMetricCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns all namespaces available in APM.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::NamespaceCollection NamespaceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/retrieve_namespaces.rb.html) to see an example of how to use retrieve_namespaces API.
    def retrieve_namespaces(apm_domain_id, opts = {})
      logger.debug 'Calling operation ConfigClient#retrieve_namespaces.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling retrieve_namespaces." if apm_domain_id.nil?

      path = '/actions/retrieveNamespaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#retrieve_namespaces') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::NamespaceCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the details of the configuration item identified by the OCID.
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [String] config_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the configuration item.
    #
    # @param [OCI::ApmConfig::Models::UpdateConfigDetails] update_config_details The configuration details to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_dry_run Indicates that the request is a dry run, if set to \"true\". A dry run request does not modify the
    #   configuration item details and is used only to perform validation on the submitted data.
    #    (default to false)
    # @return [Response] A Response object with data of type {OCI::ApmConfig::Models::Config Config}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/update_config.rb.html) to see an example of how to use update_config API.
    def update_config(apm_domain_id, config_id, update_config_details, opts = {})
      logger.debug 'Calling operation ConfigClient#update_config.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling update_config." if apm_domain_id.nil?
      raise "Missing the required parameter 'config_id' when calling update_config." if config_id.nil?
      raise "Missing the required parameter 'update_config_details' when calling update_config." if update_config_details.nil?
      raise "Parameter value for 'config_id' must not be blank" if OCI::Internal::Util.blank_string?(config_id)

      path = '/configs/{configId}'.sub('{configId}', config_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-dry-run'] = opts[:opc_dry_run] if opts[:opc_dry_run]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_config_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#update_config') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmConfig::Models::Config'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validates the Span Filter pattern (filterText) for syntactic correctness.
    # Returns 204 on success, 422 when validation fails.
    #
    # @param [String] apm_domain_id The APM Domain ID the request is intended for.
    #
    # @param [OCI::ApmConfig::Models::ValidateSpanFilterPatternDetails] validate_span_filter_pattern_details The Span Filter pattern to validate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmconfig/validate_span_filter_pattern.rb.html) to see an example of how to use validate_span_filter_pattern API.
    def validate_span_filter_pattern(apm_domain_id, validate_span_filter_pattern_details, opts = {})
      logger.debug 'Calling operation ConfigClient#validate_span_filter_pattern.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling validate_span_filter_pattern." if apm_domain_id.nil?
      raise "Missing the required parameter 'validate_span_filter_pattern_details' when calling validate_span_filter_pattern." if validate_span_filter_pattern_details.nil?

      path = '/actions/validateSpanFilterPattern'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(validate_span_filter_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ConfigClient#validate_span_filter_pattern') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
