# Copyright (c) 2018-2019 VMware, Inc.  All Rights Reserved.
# SPDX-License-Identifier: MIT

# DO NOT MODIFY. THIS CODE IS GENERATED. CHANGES WILL BE OVERWRITTEN.

# cis - No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)


require 'uri'

module VSphereAutomation
  module CIS
  class TaggingTagApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Adds the {@param.name usedByEntity} to the {@link TagModel#usedBy} subscribers {@term set}. If the {@param.name usedByEntity} is already in the {@term set}, then this becomes a no-op. To invoke this {@term operation}, you need the modify {@link TagModel#usedBy} privilege on the tag.
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil]
    def add_to_used_by(tag_id, request_body, opts = {})
      add_to_used_by_with_http_info(tag_id, request_body, opts)
      nil
    end

    # Adds the {@param.name usedByEntity} to the {@link TagModel#usedBy} subscribers {@term set}. If the {@param.name usedByEntity} is already in the {@term set}, then this becomes a no-op. To invoke this {@term operation}, you need the modify {@link TagModel#usedBy} privilege on the tag.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil, Fixnum, Hash)>] nil, response status code and response headers
    def add_to_used_by_with_http_info(tag_id, request_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.add_to_used_by ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.add_to_used_by"
      end
      # verify the required parameter 'request_body' is set
      if @api_client.config.client_side_validation && request_body.nil?
        fail ArgumentError, "Missing the required parameter 'request_body' when calling TaggingTagApi.add_to_used_by"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}?~action=add-to-used-by'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_body)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#add_to_used_by\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Creates a tag. To invoke this {@term operation}, you need the create tag privilege on the input category.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [CisTaggingTagCreateResult|VapiStdErrorsInvalidArgumentError|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|]
    def create(request_body, opts = {})
      data, _status_code, _headers = create_with_http_info(request_body, opts)
      data
    end

    # Creates a tag. To invoke this {@term operation}, you need the create tag privilege on the input category.
    # @api private
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(CisTaggingTagCreateResult|VapiStdErrorsInvalidArgumentError|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|, Fixnum, Hash)>]  data, response status code and response headers
    def create_with_http_info(request_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.create ...'
      end
      # verify the required parameter 'request_body' is set
      if @api_client.config.client_side_validation && request_body.nil?
        fail ArgumentError, "Missing the required parameter 'request_body' when calling TaggingTagApi.create"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_body)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
	:return_type => {
	  '200' => 'CIS::CisTaggingTagCreateResult',
	  '400' => 'CIS::VapiStdErrorsInvalidArgumentError',
	  '403' => 'CIS::VapiStdErrorsUnauthorizedError',
	  '404' => 'CIS::VapiStdErrorsNotFoundError',
	})
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Deletes an existing tag. To invoke this {@term operation}, you need the delete privilege on the tag.
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil]
    def delete(tag_id, opts = {})
      delete_with_http_info(tag_id, opts)
      nil
    end

    # Deletes an existing tag. To invoke this {@term operation}, you need the delete privilege on the tag.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [Array<(|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(tag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.delete ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.delete"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Fetches the tag information for the given tag identifier. To invoke this {@term operation}, you need the read privilege on the tag in order to view the tag info.
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [CisTaggingTagResult|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|]
    def get(tag_id, opts = {})
      data, _status_code, _headers = get_with_http_info(tag_id, opts)
      data
    end

    # Fetches the tag information for the given tag identifier. To invoke this {@term operation}, you need the read privilege on the tag in order to view the tag info.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CisTaggingTagResult|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|, Fixnum, Hash)>]  data, response status code and response headers
    def get_with_http_info(tag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.get ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.get"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
	:return_type => {
	  '200' => 'CIS::CisTaggingTagResult',
	  '403' => 'CIS::VapiStdErrorsUnauthorizedError',
	  '404' => 'CIS::VapiStdErrorsNotFoundError',
	})
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Enumerates the tags in the system. To invoke this {@term operation}, you need read privilege on the individual tags. The {@term list} will only contain tags for which you have read privileges.
    # @param [Hash] opts the optional parameters
    # @return [CisTaggingTagListResult|]
    def list(opts = {})
      data, _status_code, _headers = list_with_http_info(opts)
      data
    end

    # Enumerates the tags in the system. To invoke this {@term operation}, you need read privilege on the individual tags. The {@term list} will only contain tags for which you have read privileges.
    # @api private
    # @param [Hash] opts the optional parameters
    # @return [Array<(CisTaggingTagListResult|, Fixnum, Hash)>]  data, response status code and response headers
    def list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.list ...'
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
	:return_type => {
	  '200' => 'CIS::CisTaggingTagListResult',
	})
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Enumerates all tags for the given category. To invoke this {@term operation}, you need the read privilege on the given category and the individual tags in that category.
    # @param category_id The identifier of the input category.
    # @param [Hash] opts the optional parameters
    # @return [CisTaggingTagListTagsForCategoryResult|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|]
    def list_tags_for_category(category_id, opts = {})
      data, _status_code, _headers = list_tags_for_category_with_http_info(category_id, opts)
      data
    end

    # Enumerates all tags for the given category. To invoke this {@term operation}, you need the read privilege on the given category and the individual tags in that category.
    # @api private
    # @param category_id The identifier of the input category.
    # @param [Hash] opts the optional parameters
    # @return [Array<(CisTaggingTagListTagsForCategoryResult|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|, Fixnum, Hash)>]  data, response status code and response headers
    def list_tags_for_category_with_http_info(category_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.list_tags_for_category ...'
      end
      # verify the required parameter 'category_id' is set
      if @api_client.config.client_side_validation && category_id.nil?
        fail ArgumentError, "Missing the required parameter 'category_id' when calling TaggingTagApi.list_tags_for_category"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{category_id}?~action=list-tags-for-category'.sub('{' + 'category_id' + '}', category_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
	:return_type => {
	  '200' => 'CIS::CisTaggingTagListTagsForCategoryResult',
	  '403' => 'CIS::VapiStdErrorsUnauthorizedError',
	  '404' => 'CIS::VapiStdErrorsNotFoundError',
	})
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#list_tags_for_category\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Enumerates all tags for which the {@param.name usedByEntity} is part of the {@link TagModel#usedBy} subscribers {@term set}. To invoke this {@term operation}, you need the read privilege on the individual tags.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [CisTaggingTagListUsedTagsResult|]
    def list_used_tags(request_body, opts = {})
      data, _status_code, _headers = list_used_tags_with_http_info(request_body, opts)
      data
    end

    # Enumerates all tags for which the {@param.name usedByEntity} is part of the {@link TagModel#usedBy} subscribers {@term set}. To invoke this {@term operation}, you need the read privilege on the individual tags.
    # @api private
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(CisTaggingTagListUsedTagsResult|, Fixnum, Hash)>]  data, response status code and response headers
    def list_used_tags_with_http_info(request_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.list_used_tags ...'
      end
      # verify the required parameter 'request_body' is set
      if @api_client.config.client_side_validation && request_body.nil?
        fail ArgumentError, "Missing the required parameter 'request_body' when calling TaggingTagApi.list_used_tags"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag?~action=list-used-tags'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_body)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
	:return_type => {
	  '200' => 'CIS::CisTaggingTagListUsedTagsResult',
	})
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#list_used_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Removes the {@param.name usedByEntity} from the {@link TagModel#usedBy} subscribers set. If the {@param.name usedByEntity} is not using this tag, then this becomes a no-op. To invoke this {@term operation}, you need modify {@link TagModel#usedBy} privilege on the tag.
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil]
    def remove_from_used_by(tag_id, request_body, opts = {})
      remove_from_used_by_with_http_info(tag_id, request_body, opts)
      nil
    end

    # Removes the {@param.name usedByEntity} from the {@link TagModel#usedBy} subscribers set. If the {@param.name usedByEntity} is not using this tag, then this becomes a no-op. To invoke this {@term operation}, you need modify {@link TagModel#usedBy} privilege on the tag.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil, Fixnum, Hash)>] nil, response status code and response headers
    def remove_from_used_by_with_http_info(tag_id, request_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.remove_from_used_by ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.remove_from_used_by"
      end
      # verify the required parameter 'request_body' is set
      if @api_client.config.client_side_validation && request_body.nil?
        fail ArgumentError, "Missing the required parameter 'request_body' when calling TaggingTagApi.remove_from_used_by"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}?~action=remove-from-used-by'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_body)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#remove_from_used_by\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Revokes all propagating permissions on the given tag. You should then attach a direct permission with tagging privileges on the given tag. To invoke this {@term operation}, you need tag related privileges (direct or propagating) on the concerned tag.
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil]
    def revoke_propagating_permissions(tag_id, opts = {})
      revoke_propagating_permissions_with_http_info(tag_id, opts)
      nil
    end

    # Revokes all propagating permissions on the given tag. You should then attach a direct permission with tagging privileges on the given tag. To invoke this {@term operation}, you need tag related privileges (direct or propagating) on the concerned tag.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param [Hash] opts the optional parameters
    # @return [Array<(|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil, Fixnum, Hash)>] nil, response status code and response headers
    def revoke_propagating_permissions_with_http_info(tag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.revoke_propagating_permissions ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.revoke_propagating_permissions"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}?~action=revoke-propagating-permissions'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#revoke_propagating_permissions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Updates an existing tag. To invoke this {@term operation}, you need the edit privilege on the tag.
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [|VapiStdErrorsInvalidArgumentError|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil]
    def update(tag_id, request_body, opts = {})
      update_with_http_info(tag_id, request_body, opts)
      nil
    end

    # Updates an existing tag. To invoke this {@term operation}, you need the edit privilege on the tag.
    # @api private
    # @param tag_id The identifier of the input tag.
    # @param request_body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(|VapiStdErrorsInvalidArgumentError|VapiStdErrorsUnauthorizedError|VapiStdErrorsNotFoundError|nil, Fixnum, Hash)>] nil, response status code and response headers
    def update_with_http_info(tag_id, request_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TaggingTagApi.update ...'
      end
      # verify the required parameter 'tag_id' is set
      if @api_client.config.client_side_validation && tag_id.nil?
        fail ArgumentError, "Missing the required parameter 'tag_id' when calling TaggingTagApi.update"
      end
      # verify the required parameter 'request_body' is set
      if @api_client.config.client_side_validation && request_body.nil?
        fail ArgumentError, "Missing the required parameter 'request_body' when calling TaggingTagApi.update"
      end
      # resource path
      local_var_path = '/com/vmware/cis/tagging/tag/id:{tag_id}'.sub('{' + 'tag_id' + '}', tag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_body)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TaggingTagApi#update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
  end
end
