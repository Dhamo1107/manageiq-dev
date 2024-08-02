# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for managing certificates.
  class CertificatesManagement::CertificatesManagementClient
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


    # Creates a new CertificatesManagementClient.
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
        @endpoint = endpoint + '/20210224'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "CertificatesManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://certificatesmanagement.{region}.oci.{secondLevelDomain}') + '/20210224'
      logger.info "CertificatesManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the scheduled deletion of the specified certificate authority (CA).
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/cancel_certificate_authority_deletion.rb.html) to see an example of how to use cancel_certificate_authority_deletion API.
    def cancel_certificate_authority_deletion(certificate_authority_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#cancel_certificate_authority_deletion.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling cancel_certificate_authority_deletion." if certificate_authority_id.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}/actions/cancelDeletion'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#cancel_certificate_authority_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the scheduled deletion of the specified certificate authority (CA) version. Canceling
    # a scheduled deletion restores the CA version's lifecycle state to what
    # it was before its scheduled deletion.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Integer] certificate_authority_version_number The version number of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/cancel_certificate_authority_version_deletion.rb.html) to see an example of how to use cancel_certificate_authority_version_deletion API.
    def cancel_certificate_authority_version_deletion(certificate_authority_id, certificate_authority_version_number, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#cancel_certificate_authority_version_deletion.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling cancel_certificate_authority_version_deletion." if certificate_authority_id.nil?
      raise "Missing the required parameter 'certificate_authority_version_number' when calling cancel_certificate_authority_version_deletion." if certificate_authority_version_number.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)
      raise "Parameter value for 'certificate_authority_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_version_number)

      path = '/certificateAuthorities/{certificateAuthorityId}/version/{certificateAuthorityVersionNumber}/actions/cancelDeletion'.sub('{certificateAuthorityId}', certificate_authority_id.to_s).sub('{certificateAuthorityVersionNumber}', certificate_authority_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#cancel_certificate_authority_version_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the pending deletion of the specified certificate. Canceling
    # a scheduled deletion restores the certificate's lifecycle state to what
    # it was before you scheduled the certificate for deletion.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/cancel_certificate_deletion.rb.html) to see an example of how to use cancel_certificate_deletion API.
    def cancel_certificate_deletion(certificate_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#cancel_certificate_deletion.' if logger

      raise "Missing the required parameter 'certificate_id' when calling cancel_certificate_deletion." if certificate_id.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}/actions/cancelDeletion'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#cancel_certificate_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the scheduled deletion of the specified certificate version.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Integer] certificate_version_number The version number of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/cancel_certificate_version_deletion.rb.html) to see an example of how to use cancel_certificate_version_deletion API.
    def cancel_certificate_version_deletion(certificate_id, certificate_version_number, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#cancel_certificate_version_deletion.' if logger

      raise "Missing the required parameter 'certificate_id' when calling cancel_certificate_version_deletion." if certificate_id.nil?
      raise "Missing the required parameter 'certificate_version_number' when calling cancel_certificate_version_deletion." if certificate_version_number.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)
      raise "Parameter value for 'certificate_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_version_number)

      path = '/certificates/{certificateId}/version/{certificateVersionNumber}/actions/cancelDeletion'.sub('{certificateId}', certificate_id.to_s).sub('{certificateVersionNumber}', certificate_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#cancel_certificate_version_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a CA bundle to a different compartment in the same tenancy. For information about
    # moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When provided, if-match is checked against the ETag values of the secret.
    #
    # @param [String] ca_bundle_id The OCID of the CA bundle.
    # @param [OCI::CertificatesManagement::Models::ChangeCaBundleCompartmentDetails] change_ca_bundle_compartment_details The updated compartment details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/change_ca_bundle_compartment.rb.html) to see an example of how to use change_ca_bundle_compartment API.
    def change_ca_bundle_compartment(ca_bundle_id, change_ca_bundle_compartment_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#change_ca_bundle_compartment.' if logger

      raise "Missing the required parameter 'ca_bundle_id' when calling change_ca_bundle_compartment." if ca_bundle_id.nil?
      raise "Missing the required parameter 'change_ca_bundle_compartment_details' when calling change_ca_bundle_compartment." if change_ca_bundle_compartment_details.nil?
      raise "Parameter value for 'ca_bundle_id' must not be blank" if OCI::Internal::Util.blank_string?(ca_bundle_id)

      path = '/caBundles/{caBundleId}/actions/changeCompartment'.sub('{caBundleId}', ca_bundle_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_ca_bundle_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#change_ca_bundle_compartment') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a certificate authority (CA) to a different compartment within the same tenancy. For information about
    # moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When provided, If-Match is checked against the ETag values of the source.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [OCI::CertificatesManagement::Models::ChangeCertificateAuthorityCompartmentDetails] change_certificate_authority_compartment_details The updated compartment details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/change_certificate_authority_compartment.rb.html) to see an example of how to use change_certificate_authority_compartment API.
    def change_certificate_authority_compartment(certificate_authority_id, change_certificate_authority_compartment_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#change_certificate_authority_compartment.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling change_certificate_authority_compartment." if certificate_authority_id.nil?
      raise "Missing the required parameter 'change_certificate_authority_compartment_details' when calling change_certificate_authority_compartment." if change_certificate_authority_compartment_details.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}/actions/changeCompartment'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_certificate_authority_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#change_certificate_authority_compartment') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a certificate to a different compartment within the same tenancy. For information about
    # moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When provided, if-match is checked against the ETag values of the secret.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [OCI::CertificatesManagement::Models::ChangeCertificateCompartmentDetails] change_certificate_compartment_details The updated compartment details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/change_certificate_compartment.rb.html) to see an example of how to use change_certificate_compartment API.
    def change_certificate_compartment(certificate_id, change_certificate_compartment_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#change_certificate_compartment.' if logger

      raise "Missing the required parameter 'certificate_id' when calling change_certificate_compartment." if certificate_id.nil?
      raise "Missing the required parameter 'change_certificate_compartment_details' when calling change_certificate_compartment." if change_certificate_compartment_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}/actions/changeCompartment'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_certificate_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#change_certificate_compartment') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new CA bundle according to the details of the request.
    # @param [OCI::CertificatesManagement::Models::CreateCaBundleDetails] create_ca_bundle_details The details of the request to create a new CA bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CaBundle CaBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/create_ca_bundle.rb.html) to see an example of how to use create_ca_bundle API.
    def create_ca_bundle(create_ca_bundle_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#create_ca_bundle.' if logger

      raise "Missing the required parameter 'create_ca_bundle_details' when calling create_ca_bundle." if create_ca_bundle_details.nil?

      path = '/caBundles'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_ca_bundle_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#create_ca_bundle') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CaBundle'
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


    # Creates a new certificate according to the details of the request.
    # @param [OCI::CertificatesManagement::Models::CreateCertificateDetails] create_certificate_details The details of the request to create a new certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::Certificate Certificate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/create_certificate.rb.html) to see an example of how to use create_certificate API.
    def create_certificate(create_certificate_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#create_certificate.' if logger

      raise "Missing the required parameter 'create_certificate_details' when calling create_certificate." if create_certificate_details.nil?

      path = '/certificates'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_certificate_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#create_certificate') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::Certificate'
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


    # Creates a new certificate authority (CA) according to the details of the request.
    # @param [OCI::CertificatesManagement::Models::CreateCertificateAuthorityDetails] create_certificate_authority_details The details of the request to create a new CA.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthority CertificateAuthority}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/create_certificate_authority.rb.html) to see an example of how to use create_certificate_authority API.
    def create_certificate_authority(create_certificate_authority_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#create_certificate_authority.' if logger

      raise "Missing the required parameter 'create_certificate_authority_details' when calling create_certificate_authority." if create_certificate_authority_details.nil?

      path = '/certificateAuthorities'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_certificate_authority_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#create_certificate_authority') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthority'
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


    # Deletes the specified CA bundle.
    # @param [String] ca_bundle_id The OCID of the CA bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/delete_ca_bundle.rb.html) to see an example of how to use delete_ca_bundle API.
    def delete_ca_bundle(ca_bundle_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#delete_ca_bundle.' if logger

      raise "Missing the required parameter 'ca_bundle_id' when calling delete_ca_bundle." if ca_bundle_id.nil?
      raise "Parameter value for 'ca_bundle_id' must not be blank" if OCI::Internal::Util.blank_string?(ca_bundle_id)

      path = '/caBundles/{caBundleId}'.sub('{caBundleId}', ca_bundle_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#delete_ca_bundle') do
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


    # Gets details about the specified association.
    # @param [String] association_id The OCID of an association between a certificate-related resource and another Oracle Cloud Infrastructure resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::Association Association}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_association.rb.html) to see an example of how to use get_association API.
    def get_association(association_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_association.' if logger

      raise "Missing the required parameter 'association_id' when calling get_association." if association_id.nil?
      raise "Parameter value for 'association_id' must not be blank" if OCI::Internal::Util.blank_string?(association_id)

      path = '/associations/{associationId}'.sub('{associationId}', association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::Association'
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


    # Gets details about the specified CA bundle.
    # @param [String] ca_bundle_id The OCID of the CA bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CaBundle CaBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_ca_bundle.rb.html) to see an example of how to use get_ca_bundle API.
    def get_ca_bundle(ca_bundle_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_ca_bundle.' if logger

      raise "Missing the required parameter 'ca_bundle_id' when calling get_ca_bundle." if ca_bundle_id.nil?
      raise "Parameter value for 'ca_bundle_id' must not be blank" if OCI::Internal::Util.blank_string?(ca_bundle_id)

      path = '/caBundles/{caBundleId}'.sub('{caBundleId}', ca_bundle_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_ca_bundle') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CaBundle'
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


    # Gets details about the specified certificate.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::Certificate Certificate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_certificate.rb.html) to see an example of how to use get_certificate API.
    def get_certificate(certificate_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_certificate.' if logger

      raise "Missing the required parameter 'certificate_id' when calling get_certificate." if certificate_id.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_certificate') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::Certificate'
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


    # Gets details about the specified certificate authority (CA).
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthority CertificateAuthority}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_certificate_authority.rb.html) to see an example of how to use get_certificate_authority API.
    def get_certificate_authority(certificate_authority_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_certificate_authority.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling get_certificate_authority." if certificate_authority_id.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_certificate_authority') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthority'
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


    # Gets details about the specified certificate authority (CA) version.
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Integer] certificate_authority_version_number The version number of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthorityVersion CertificateAuthorityVersion}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_certificate_authority_version.rb.html) to see an example of how to use get_certificate_authority_version API.
    def get_certificate_authority_version(certificate_authority_id, certificate_authority_version_number, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_certificate_authority_version.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling get_certificate_authority_version." if certificate_authority_id.nil?
      raise "Missing the required parameter 'certificate_authority_version_number' when calling get_certificate_authority_version." if certificate_authority_version_number.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)
      raise "Parameter value for 'certificate_authority_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_version_number)

      path = '/certificateAuthorities/{certificateAuthorityId}/version/{certificateAuthorityVersionNumber}'.sub('{certificateAuthorityId}', certificate_authority_id.to_s).sub('{certificateAuthorityVersionNumber}', certificate_authority_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_certificate_authority_version') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthorityVersion'
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


    # Gets details about the specified version of a certificate.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Integer] certificate_version_number The version number of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateVersion CertificateVersion}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/get_certificate_version.rb.html) to see an example of how to use get_certificate_version API.
    def get_certificate_version(certificate_id, certificate_version_number, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#get_certificate_version.' if logger

      raise "Missing the required parameter 'certificate_id' when calling get_certificate_version." if certificate_id.nil?
      raise "Missing the required parameter 'certificate_version_number' when calling get_certificate_version." if certificate_version_number.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)
      raise "Parameter value for 'certificate_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_version_number)

      path = '/certificates/{certificateId}/version/{certificateVersionNumber}'.sub('{certificateId}', certificate_id.to_s).sub('{certificateVersionNumber}', certificate_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#get_certificate_version') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateVersion'
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


    # Lists all associations that match the query parameters.
    # Optionally, you can use the parameter `FilterByAssociationIdQueryParam` to limit the result set to a single item that matches the specified association.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :compartment_id A filter that returns only resources that match the given compartment OCID.
    # @option opts [String] :certificates_resource_id A filter that returns only resources that match the given OCID of a certificate-related resource.
    # @option opts [String] :associated_resource_id A filter that returns only resources that match the given OCID of an associated Oracle Cloud Infrastructure resource.
    # @option opts [String] :association_id The OCID of the association. If the parameter is set to null, the service lists all associations.
    # @option opts [String] :name A filter that returns only resources that match the specified name.
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default order for `TIMECREATED` is descending.
    #   The default order for `NAME` is ascending.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :association_type Type of associations to list. If the parameter is set to null, the service lists all types of associations.
    #   Allowed values are: CERTIFICATE, CERTIFICATE_AUTHORITY, CA_BUNDLE
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::AssociationCollection AssociationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_associations.rb.html) to see an example of how to use list_associations API.
    def list_associations(opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_associations.' if logger


      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:association_type] && !%w[CERTIFICATE CERTIFICATE_AUTHORITY CA_BUNDLE].include?(opts[:association_type])
        raise 'Invalid value for "association_type", must be one of CERTIFICATE, CERTIFICATE_AUTHORITY, CA_BUNDLE.'
      end

      path = '/associations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:certificatesResourceId] = opts[:certificates_resource_id] if opts[:certificates_resource_id]
      query_params[:associatedResourceId] = opts[:associated_resource_id] if opts[:associated_resource_id]
      query_params[:associationId] = opts[:association_id] if opts[:association_id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:associationType] = opts[:association_type] if opts[:association_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::AssociationCollection'
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


    # Lists all CA bundles that match the query parameters.
    # Optionally, you can use the parameter `FilterByCaBundleIdQueryParam` to limit the result set to a single item that matches the specified CA bundle.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :compartment_id A filter that returns only resources that match the given compartment OCID.
    # @option opts [String] :lifecycle_state A filter that returns only resources that match the given lifecycle state. The state value is case-insensitive.
    #   Allowed values are: CREATING, ACTIVE, UPDATING, DELETING, DELETED, FAILED
    # @option opts [String] :name A filter that returns only resources that match the specified name.
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default order for `TIMECREATED` is descending.
    #   The default order for `NAME` is ascending.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :ca_bundle_id The OCID of the CA bundle.
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CaBundleCollection CaBundleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_ca_bundles.rb.html) to see an example of how to use list_ca_bundles API.
    def list_ca_bundles(opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_ca_bundles.' if logger


      if opts[:lifecycle_state] && !%w[CREATING ACTIVE UPDATING DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, UPDATING, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/caBundles'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:caBundleId] = opts[:ca_bundle_id] if opts[:ca_bundle_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_ca_bundles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CaBundleCollection'
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


    # Lists all certificate authorities (CAs) in the specified compartment.
    # Optionally, you can use the parameter `FilterByCertificateAuthorityIdQueryParam` to limit the results to a single item that matches the specified CA.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :compartment_id A filter that returns only resources that match the given compartment OCID.
    # @option opts [String] :lifecycle_state A filter that returns only resources that match the given lifecycle state. The state value is case-insensitive.
    #   Allowed values are: CREATING, ACTIVE, UPDATING, DELETING, DELETED, SCHEDULING_DELETION, PENDING_DELETION, CANCELLING_DELETION, FAILED
    # @option opts [String] :name A filter that returns only resources that match the specified name.
    # @option opts [String] :issuer_certificate_authority_id The OCID of the certificate authority (CA). If the parameter is set to null, the service lists all CAs.
    # @option opts [String] :certificate_authority_id The OCID of the certificate authority (CA). If the parameter is set to null, the service lists all CAs.
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default
    #   order for `EXPIRATIONDATE` and 'TIMECREATED' is descending. The default order for `NAME`
    #   is ascending.
    #
    #   Allowed values are: NAME, EXPIRATIONDATE, TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthorityCollection CertificateAuthorityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_certificate_authorities.rb.html) to see an example of how to use list_certificate_authorities API.
    def list_certificate_authorities(opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_certificate_authorities.' if logger


      if opts[:lifecycle_state] && !%w[CREATING ACTIVE UPDATING DELETING DELETED SCHEDULING_DELETION PENDING_DELETION CANCELLING_DELETION FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, UPDATING, DELETING, DELETED, SCHEDULING_DELETION, PENDING_DELETION, CANCELLING_DELETION, FAILED.'
      end

      if opts[:sort_by] && !%w[NAME EXPIRATIONDATE TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, EXPIRATIONDATE, TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/certificateAuthorities'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:issuerCertificateAuthorityId] = opts[:issuer_certificate_authority_id] if opts[:issuer_certificate_authority_id]
      query_params[:certificateAuthorityId] = opts[:certificate_authority_id] if opts[:certificate_authority_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_certificate_authorities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthorityCollection'
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


    # Lists all versions for the specified certificate authority (CA).
    # Optionally, you can use the parameter `FilterByVersionNumberQueryParam` to limit the results to a single item that matches the specified version number.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [Integer] :version_number A filter that returns only resources that match the specified version number. The default value is 0, which means that this filter is not applied.
    #    (default to 0)
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default order for 'VERSION_NUMBER' is ascending.
    #
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthorityVersionCollection CertificateAuthorityVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_certificate_authority_versions.rb.html) to see an example of how to use list_certificate_authority_versions API.
    def list_certificate_authority_versions(certificate_authority_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_certificate_authority_versions.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling list_certificate_authority_versions." if certificate_authority_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}/versions'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_certificate_authority_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthorityVersionCollection'
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


    # Lists all certificate versions for the specified certificate.
    # Optionally, you can use the parameter `FilterByVersionNumberQueryParam` to limit the result set to a single item that matches the specified version number.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [Integer] :version_number A filter that returns only resources that match the specified version number. The default value is 0, which means that this filter is not applied.
    #    (default to 0)
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default order for 'VERSION_NUMBER' is ascending.
    #
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateVersionCollection CertificateVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_certificate_versions.rb.html) to see an example of how to use list_certificate_versions API.
    def list_certificate_versions(certificate_id, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_certificate_versions.' if logger

      raise "Missing the required parameter 'certificate_id' when calling list_certificate_versions." if certificate_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}/versions'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_certificate_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateVersionCollection'
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


    # Lists all certificates that match the query parameters.
    # Optionally, you can use the parameter `FilterByCertificateIdQueryParam` to limit the result set to a single item that matches the specified certificate.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :compartment_id A filter that returns only resources that match the given compartment OCID.
    # @option opts [String] :lifecycle_state A filter that returns only resources that match the given lifecycle state. The state value is case-insensitive.
    #   Allowed values are: CREATING, ACTIVE, UPDATING, DELETING, DELETED, SCHEDULING_DELETION, PENDING_DELETION, CANCELLING_DELETION, FAILED
    # @option opts [String] :name A filter that returns only resources that match the specified name.
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default
    #   order for `EXPIRATIONDATE` and 'TIMECREATED' is descending. The default order for `NAME`
    #   is ascending.
    #
    #   Allowed values are: NAME, EXPIRATIONDATE, TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :issuer_certificate_authority_id The OCID of the certificate authority (CA). If the parameter is set to null, the service lists all CAs.
    # @option opts [String] :certificate_id The OCID of the certificate. If the parameter is set to null, the service lists all certificates.
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateCollection CertificateCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/list_certificates.rb.html) to see an example of how to use list_certificates API.
    def list_certificates(opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#list_certificates.' if logger


      if opts[:lifecycle_state] && !%w[CREATING ACTIVE UPDATING DELETING DELETED SCHEDULING_DELETION PENDING_DELETION CANCELLING_DELETION FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, UPDATING, DELETING, DELETED, SCHEDULING_DELETION, PENDING_DELETION, CANCELLING_DELETION, FAILED.'
      end

      if opts[:sort_by] && !%w[NAME EXPIRATIONDATE TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, EXPIRATIONDATE, TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/certificates'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:issuerCertificateAuthorityId] = opts[:issuer_certificate_authority_id] if opts[:issuer_certificate_authority_id]
      query_params[:certificateId] = opts[:certificate_id] if opts[:certificate_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#list_certificates') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateCollection'
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


    # Revokes a certificate authority (CA) version.
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Integer] certificate_authority_version_number The version number of the certificate authority (CA).
    # @param [OCI::CertificatesManagement::Models::RevokeCertificateAuthorityVersionDetails] revoke_certificate_authority_version_details The details of the request to revoke a CA version.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/revoke_certificate_authority_version.rb.html) to see an example of how to use revoke_certificate_authority_version API.
    def revoke_certificate_authority_version(certificate_authority_id, certificate_authority_version_number, revoke_certificate_authority_version_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#revoke_certificate_authority_version.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling revoke_certificate_authority_version." if certificate_authority_id.nil?
      raise "Missing the required parameter 'certificate_authority_version_number' when calling revoke_certificate_authority_version." if certificate_authority_version_number.nil?
      raise "Missing the required parameter 'revoke_certificate_authority_version_details' when calling revoke_certificate_authority_version." if revoke_certificate_authority_version_details.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)
      raise "Parameter value for 'certificate_authority_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_version_number)

      path = '/certificateAuthorities/{certificateAuthorityId}/version/{certificateAuthorityVersionNumber}/actions/revoke'.sub('{certificateAuthorityId}', certificate_authority_id.to_s).sub('{certificateAuthorityVersionNumber}', certificate_authority_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(revoke_certificate_authority_version_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#revoke_certificate_authority_version') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Revokes the specified certificate version.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Integer] certificate_version_number The version number of the certificate.
    # @param [OCI::CertificatesManagement::Models::RevokeCertificateVersionDetails] revoke_certificate_version_details The details of the request to revoke a certificate version.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/revoke_certificate_version.rb.html) to see an example of how to use revoke_certificate_version API.
    def revoke_certificate_version(certificate_id, certificate_version_number, revoke_certificate_version_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#revoke_certificate_version.' if logger

      raise "Missing the required parameter 'certificate_id' when calling revoke_certificate_version." if certificate_id.nil?
      raise "Missing the required parameter 'certificate_version_number' when calling revoke_certificate_version." if certificate_version_number.nil?
      raise "Missing the required parameter 'revoke_certificate_version_details' when calling revoke_certificate_version." if revoke_certificate_version_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)
      raise "Parameter value for 'certificate_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_version_number)

      path = '/certificates/{certificateId}/version/{certificateVersionNumber}/actions/revoke'.sub('{certificateId}', certificate_id.to_s).sub('{certificateVersionNumber}', certificate_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(revoke_certificate_version_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#revoke_certificate_version') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified certificate authority (CA). This sets the lifecycle state of the CA to `PENDING_DELETION` and then deletes it after the specified retention period ends. If needed, you can determine the status of the deletion by using `GetCertificateAuthority`.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [OCI::CertificatesManagement::Models::ScheduleCertificateAuthorityDeletionDetails] schedule_certificate_authority_deletion_details The details of the request to schedule the deletion of a CA.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/schedule_certificate_authority_deletion.rb.html) to see an example of how to use schedule_certificate_authority_deletion API.
    def schedule_certificate_authority_deletion(certificate_authority_id, schedule_certificate_authority_deletion_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#schedule_certificate_authority_deletion.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling schedule_certificate_authority_deletion." if certificate_authority_id.nil?
      raise "Missing the required parameter 'schedule_certificate_authority_deletion_details' when calling schedule_certificate_authority_deletion." if schedule_certificate_authority_deletion_details.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}/actions/scheduleDeletion'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_certificate_authority_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#schedule_certificate_authority_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified certificate authority (CA) version.
    # This sets the lifecycle state of the CA version to `PENDING_DELETION`
    # and then deletes it after the specified retention period ends. If needed, you can determine the status of the deletion by using `GetCertificateAuthorityVersion`.
    #
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [Integer] certificate_authority_version_number The version number of the certificate authority (CA).
    # @param [OCI::CertificatesManagement::Models::ScheduleCertificateAuthorityVersionDeletionDetails] schedule_certificate_authority_version_deletion_details The details of the request to delete a CA version.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/schedule_certificate_authority_version_deletion.rb.html) to see an example of how to use schedule_certificate_authority_version_deletion API.
    def schedule_certificate_authority_version_deletion(certificate_authority_id, certificate_authority_version_number, schedule_certificate_authority_version_deletion_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#schedule_certificate_authority_version_deletion.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling schedule_certificate_authority_version_deletion." if certificate_authority_id.nil?
      raise "Missing the required parameter 'certificate_authority_version_number' when calling schedule_certificate_authority_version_deletion." if certificate_authority_version_number.nil?
      raise "Missing the required parameter 'schedule_certificate_authority_version_deletion_details' when calling schedule_certificate_authority_version_deletion." if schedule_certificate_authority_version_deletion_details.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)
      raise "Parameter value for 'certificate_authority_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_version_number)

      path = '/certificateAuthorities/{certificateAuthorityId}/version/{certificateAuthorityVersionNumber}/actions/scheduleDeletion'.sub('{certificateAuthorityId}', certificate_authority_id.to_s).sub('{certificateAuthorityVersionNumber}', certificate_authority_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_certificate_authority_version_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#schedule_certificate_authority_version_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified certificate. This sets the lifecycle state of the certificate
    # to `PENDING_DELETION` and then deletes it after the specified retention period ends.
    # You can subsequently use `GetCertificate` to determine the current deletion status.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [OCI::CertificatesManagement::Models::ScheduleCertificateDeletionDetails] schedule_certificate_deletion_details The details of the request to schedule a certificate deletion.
    #   This sets the lifecycle state of the certificate to `PENDING_DELETION` and then deletes it
    #   after the specified retention period ends.
    #   You can subsequently use `GetCertificate` to determine the current deletion status.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/schedule_certificate_deletion.rb.html) to see an example of how to use schedule_certificate_deletion API.
    def schedule_certificate_deletion(certificate_id, schedule_certificate_deletion_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#schedule_certificate_deletion.' if logger

      raise "Missing the required parameter 'certificate_id' when calling schedule_certificate_deletion." if certificate_id.nil?
      raise "Missing the required parameter 'schedule_certificate_deletion_details' when calling schedule_certificate_deletion." if schedule_certificate_deletion_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}/actions/scheduleDeletion'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_certificate_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#schedule_certificate_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified certificate version. This sets the lifecycle state of the certificate version to `PENDING_DELETION` and then deletes it after the specified retention period ends. You can only
    # delete a certificate version if the certificate version rotation state is marked as `DEPRECATED`.
    #
    # You can subsequently use `GetCertificateVersion` to determine the current certificate version deletion status.
    #
    # @param [String] certificate_id The OCID of the certificate.
    # @param [Integer] certificate_version_number The version number of the certificate.
    # @param [OCI::CertificatesManagement::Models::ScheduleCertificateVersionDeletionDetails] schedule_certificate_version_deletion_details The details of the request to delete a certificate version.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/schedule_certificate_version_deletion.rb.html) to see an example of how to use schedule_certificate_version_deletion API.
    def schedule_certificate_version_deletion(certificate_id, certificate_version_number, schedule_certificate_version_deletion_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#schedule_certificate_version_deletion.' if logger

      raise "Missing the required parameter 'certificate_id' when calling schedule_certificate_version_deletion." if certificate_id.nil?
      raise "Missing the required parameter 'certificate_version_number' when calling schedule_certificate_version_deletion." if certificate_version_number.nil?
      raise "Missing the required parameter 'schedule_certificate_version_deletion_details' when calling schedule_certificate_version_deletion." if schedule_certificate_version_deletion_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)
      raise "Parameter value for 'certificate_version_number' must not be blank" if OCI::Internal::Util.blank_string?(certificate_version_number)

      path = '/certificates/{certificateId}/version/{certificateVersionNumber}/actions/scheduleDeletion'.sub('{certificateId}', certificate_id.to_s).sub('{certificateVersionNumber}', certificate_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_certificate_version_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#schedule_certificate_version_deletion') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the properties of a CA bundle.
    # @param [String] ca_bundle_id The OCID of the CA bundle.
    # @param [OCI::CertificatesManagement::Models::UpdateCaBundleDetails] update_ca_bundle_details The details of the request to update a CA bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CaBundle CaBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/update_ca_bundle.rb.html) to see an example of how to use update_ca_bundle API.
    def update_ca_bundle(ca_bundle_id, update_ca_bundle_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#update_ca_bundle.' if logger

      raise "Missing the required parameter 'ca_bundle_id' when calling update_ca_bundle." if ca_bundle_id.nil?
      raise "Missing the required parameter 'update_ca_bundle_details' when calling update_ca_bundle." if update_ca_bundle_details.nil?
      raise "Parameter value for 'ca_bundle_id' must not be blank" if OCI::Internal::Util.blank_string?(ca_bundle_id)

      path = '/caBundles/{caBundleId}'.sub('{caBundleId}', ca_bundle_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_ca_bundle_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#update_ca_bundle') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CaBundle'
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


    # Updates the properties of a certificate.
    # @param [String] certificate_id The OCID of the certificate.
    # @param [OCI::CertificatesManagement::Models::UpdateCertificateDetails] update_certificate_details The details of the request to update a certificate.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::Certificate Certificate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/update_certificate.rb.html) to see an example of how to use update_certificate API.
    def update_certificate(certificate_id, update_certificate_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#update_certificate.' if logger

      raise "Missing the required parameter 'certificate_id' when calling update_certificate." if certificate_id.nil?
      raise "Missing the required parameter 'update_certificate_details' when calling update_certificate." if update_certificate_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_certificate_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#update_certificate') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::Certificate'
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


    # Updates the properties of the specified certificate authority (CA).
    # @param [String] certificate_authority_id The OCID of the certificate authority (CA).
    # @param [OCI::CertificatesManagement::Models::UpdateCertificateAuthorityDetails] update_certificate_authority_details The details of the request to update a CA.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::CertificatesManagement::Models::CertificateAuthority CertificateAuthority}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/certificatesmanagement/update_certificate_authority.rb.html) to see an example of how to use update_certificate_authority API.
    def update_certificate_authority(certificate_authority_id, update_certificate_authority_details, opts = {})
      logger.debug 'Calling operation CertificatesManagementClient#update_certificate_authority.' if logger

      raise "Missing the required parameter 'certificate_authority_id' when calling update_certificate_authority." if certificate_authority_id.nil?
      raise "Missing the required parameter 'update_certificate_authority_details' when calling update_certificate_authority." if update_certificate_authority_details.nil?
      raise "Parameter value for 'certificate_authority_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_authority_id)

      path = '/certificateAuthorities/{certificateAuthorityId}'.sub('{certificateAuthorityId}', certificate_authority_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_certificate_authority_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CertificatesManagementClient#update_certificate_authority') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CertificatesManagement::Models::CertificateAuthority'
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
