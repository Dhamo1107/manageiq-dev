# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Support Management API to manage support requests. For more information, see [Getting Help and Contacting Support](/iaas/Content/GSG/Tasks/contactingsupport.htm). **Note**: Before you can create service requests with this API, you need to have an Oracle Single Sign On (SSO) account, and you need to register your Customer Support Identifier (CSI) with My Oracle Support.
  class Cims::IncidentClient
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


    # Creates a new IncidentClient.
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
        @endpoint = endpoint + '/20181231'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "IncidentClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://incidentmanagement.{region}.{secondLevelDomain}') + '/20181231'
      logger.info "IncidentClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Enables the customer to create an support ticket.
    # @param [OCI::Cims::Models::CreateIncident] create_incident_details Incident information
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :homeregion The region of the tenancy.
    # @return [Response] A Response object with data of type {OCI::Cims::Models::Incident Incident}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/create_incident.rb.html) to see an example of how to use create_incident API.
    def create_incident(create_incident_details, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#create_incident.' if logger

      raise "Missing the required parameter 'create_incident_details' when calling create_incident." if create_incident_details.nil?
      raise "Missing the required parameter 'ocid' when calling create_incident." if ocid.nil?

      path = '/v2/incidents'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_incident_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#create_incident') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Cims::Models::Incident'
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


    # Gets the details of the support ticket.
    # @param [String] incident_key Unique identifier for the support ticket.
    # @param [String] csi The Customer Support Identifier associated with the support account.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :homeregion The region of the tenancy.
    # @option opts [String] :problem_type The kind of support request.
    # @return [Response] A Response object with data of type {OCI::Cims::Models::Incident Incident}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/get_incident.rb.html) to see an example of how to use get_incident API.
    def get_incident(incident_key, csi, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#get_incident.' if logger

      raise "Missing the required parameter 'incident_key' when calling get_incident." if incident_key.nil?
      raise "Missing the required parameter 'csi' when calling get_incident." if csi.nil?
      raise "Missing the required parameter 'ocid' when calling get_incident." if ocid.nil?
      raise "Parameter value for 'incident_key' must not be blank" if OCI::Internal::Util.blank_string?(incident_key)

      path = '/v2/incidents/{incidentKey}'.sub('{incidentKey}', incident_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:csi] = csi
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      header_params[:'problem-type'] = opts[:problem_type] if opts[:problem_type]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#get_incident') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Cims::Models::Incident'
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


    # Gets the status of the service.
    # @param [String] source The system that generated the support ticket, such as My Oracle Support.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :homeregion The region of the tenancy.
    # @return [Response] A Response object with data of type {OCI::Cims::Models::Status Status}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/get_status.rb.html) to see an example of how to use get_status API.
    def get_status(source, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#get_status.' if logger

      raise "Missing the required parameter 'source' when calling get_status." if source.nil?
      raise "Missing the required parameter 'ocid' when calling get_status." if ocid.nil?
      raise "Parameter value for 'source' must not be blank" if OCI::Internal::Util.blank_string?(source)

      path = '/v2/incidents/status/{source}'.sub('{source}', source.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#get_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Cims::Models::Status'
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


    # During support ticket creation, returns the list of all possible products that Oracle Cloud Infrastructure supports.
    # @param [String] problem_type The kind of support request.
    # @param [String] compartment_id The OCID of the tenancy.
    # @param [String] csi The Customer Support Identifier associated with the support account.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call. For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 1)
    # @option opts [String] :sort_by The key to use to sort the returned items. (default to dateUpdated)
    # @option opts [String] :sort_order The order to sort the results in. (default to ASC)
    # @option opts [String] :name The user-friendly name of the incident type. (default to limit)
    # @option opts [String] :homeregion The region of the tenancy.
    # @return [Response] A Response object with data of type Array<{OCI::Cims::Models::IncidentResourceType IncidentResourceType}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/list_incident_resource_types.rb.html) to see an example of how to use list_incident_resource_types API.
    def list_incident_resource_types(problem_type, compartment_id, csi, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#list_incident_resource_types.' if logger

      raise "Missing the required parameter 'problem_type' when calling list_incident_resource_types." if problem_type.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_incident_resource_types." if compartment_id.nil?
      raise "Missing the required parameter 'csi' when calling list_incident_resource_types." if csi.nil?
      raise "Missing the required parameter 'ocid' when calling list_incident_resource_types." if ocid.nil?

      if opts[:sort_by] && !OCI::Cims::Models::SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Cims::Models::SORT_BY_ENUM.'
      end

      if opts[:sort_order] && !OCI::Cims::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Cims::Models::SORT_ORDER_ENUM.'
      end

      path = '/v2/incidents/incidentResourceTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:problemType] = problem_type
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:name] = opts[:name] if opts[:name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:csi] = csi
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#list_incident_resource_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Cims::Models::IncidentResourceType>'
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


    # Returns the list of support tickets raised by the tenancy.
    # @param [String] csi The Customer Support Identifier associated with the support account.
    # @param [String] compartment_id The OCID of the tenancy.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call. For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 50)
    # @option opts [String] :sort_by The key to use to sort the returned items. (default to dateUpdated)
    # @option opts [String] :sort_order The order to sort the results in. (default to ASC)
    # @option opts [String] :lifecycle_state The current state of the ticket. (default to ACTIVE)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 1)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :homeregion The region of the tenancy.
    # @option opts [String] :problem_type The kind of support request.
    # @return [Response] A Response object with data of type Array<{OCI::Cims::Models::IncidentSummary IncidentSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/list_incidents.rb.html) to see an example of how to use list_incidents API.
    def list_incidents(csi, compartment_id, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#list_incidents.' if logger

      raise "Missing the required parameter 'csi' when calling list_incidents." if csi.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_incidents." if compartment_id.nil?
      raise "Missing the required parameter 'ocid' when calling list_incidents." if ocid.nil?

      if opts[:sort_by] && !OCI::Cims::Models::SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Cims::Models::SORT_BY_ENUM.'
      end

      if opts[:sort_order] && !OCI::Cims::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Cims::Models::SORT_ORDER_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Cims::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Cims::Models::LIFECYCLE_STATE_ENUM.'
      end

      path = '/v2/incidents'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:problemType] = opts[:problem_type] if opts[:problem_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:csi] = csi
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#list_incidents') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Cims::Models::IncidentSummary>'
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


    # Updates the specified support ticket's information.
    # @param [String] incident_key Unique identifier for the support ticket.
    # @param [String] csi The Customer Support Identifier associated with the support account.
    # @param [OCI::Cims::Models::UpdateIncident] update_incident_details Details about the support ticket being updated.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :homeregion The region of the tenancy.
    # @return [Response] A Response object with data of type {OCI::Cims::Models::Incident Incident}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/update_incident.rb.html) to see an example of how to use update_incident API.
    def update_incident(incident_key, csi, update_incident_details, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#update_incident.' if logger

      raise "Missing the required parameter 'incident_key' when calling update_incident." if incident_key.nil?
      raise "Missing the required parameter 'csi' when calling update_incident." if csi.nil?
      raise "Missing the required parameter 'update_incident_details' when calling update_incident." if update_incident_details.nil?
      raise "Missing the required parameter 'ocid' when calling update_incident." if ocid.nil?
      raise "Parameter value for 'incident_key' must not be blank" if OCI::Internal::Util.blank_string?(incident_key)

      path = '/v2/incidents/{incidentKey}'.sub('{incidentKey}', incident_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:csi] = csi
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_incident_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#update_incident') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Cims::Models::Incident'
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


    # Checks whether the requested user is valid.
    # @param [String] csi The Customer Support Identifier number for the support account.
    # @param [String] ocid User OCID for Oracle Identity Cloud Service (IDCS) users who also have a federated Oracle Cloud Infrastructure account.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :problem_type The kind of support request.
    # @option opts [String] :homeregion The region of the tenancy.
    # @return [Response] A Response object with data of type {OCI::Cims::Models::ValidationResponse ValidationResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cims/validate_user.rb.html) to see an example of how to use validate_user API.
    def validate_user(csi, ocid, opts = {})
      logger.debug 'Calling operation IncidentClient#validate_user.' if logger

      raise "Missing the required parameter 'csi' when calling validate_user." if csi.nil?
      raise "Missing the required parameter 'ocid' when calling validate_user." if ocid.nil?

      path = '/v2/incidents/user/validate'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:problemType] = opts[:problem_type] if opts[:problem_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:csi] = csi
      header_params[:ocid] = ocid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:homeregion] = opts[:homeregion] if opts[:homeregion]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IncidentClient#validate_user') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Cims::Models::ValidationResponse'
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
