=begin
#Cisco Intersight

#Cisco Intersight is a management platform delivered as a service with embedded analytics for your Cisco and 3rd party IT infrastructure. This platform offers an intelligent level of management that enables IT organizations to analyze, simplify, and automate their environments in more advanced ways than the prior generations of tools. Cisco Intersight provides an integrated and intuitive management experience for resources in the traditional data center as well as at the edge. With flexible deployment options to address complex security needs, getting started with Intersight is quick and easy. Cisco Intersight has deep integration with Cisco UCS and HyperFlex systems allowing for remote deployment, configuration, and ongoing maintenance. The model-based deployment works for a single system in a remote location or hundreds of systems in a data center and enables rapid, standardized configuration and deployment. It also streamlines maintaining those systems whether you are working with small or very large configurations. The Intersight OpenAPI document defines the complete set of properties that are returned in the HTTP response. From that perspective, a client can expect that no additional properties are returned, unless these properties are explicitly defined in the OpenAPI document. However, when a client uses an older version of the Intersight OpenAPI document, the server may send additional properties because the software is more recent than the client. In that case, the client may receive properties that it does not know about. Some generated SDKs perform a strict validation of the HTTP response body against the OpenAPI document. This document was created on 2021-10-20T11:22:53Z.

The version of the OpenAPI document: 1.0.9-4870
Contact: intersight@cisco.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'cgi'

module IntersightClient
  class SearchApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a 'search.SuggestItem' resource.
    # @param search_suggest_item [SearchSuggestItem] The &#39;search.SuggestItem&#39; resource to create.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For methods that apply server-side changes, and in particular for PUT, If-Match can be used to prevent the lost update problem. It can check if the modification of a resource that the user wants to upload will not override another change that has been done since the original resource was fetched. If the request cannot be fulfilled, the 412 (Precondition Failed) response is returned. When modifying a resource using POST or PUT, the If-Match header must be set to the value of the resource ModTime property after which no lost update problem should occur. For example, a client send a GET request to obtain a resource, which includes the ModTime property. The ModTime indicates the last time the resource was created or modified. The client then sends a POST or PUT request with the If-Match header set to the ModTime property of the resource as obtained in the GET request.
    # @option opts [String] :if_none_match For methods that apply server-side changes, If-None-Match used with the * value can be used to create a resource not known to exist, guaranteeing that another resource creation didn&#39;t happen before, losing the data of the previous put. The request will be processed only if the eventually existing resource&#39;s ETag doesn&#39;t match any of the values listed. Otherwise, the status code 412 (Precondition Failed) is used. The asterisk is a special value representing any resource. It is only useful when creating a resource, usually with PUT, to check if another resource with the identity has already been created before. The comparison with the stored ETag uses the weak comparison algorithm, meaning two resources are considered identical if the content is equivalent - they don&#39;t have to be identical byte for byte.
    # @return [SearchSuggestItemResponse]
    def create_search_suggest_item(search_suggest_item, opts = {})
      data, _status_code, _headers = create_search_suggest_item_with_http_info(search_suggest_item, opts)
      data
    end

    # Create a &#39;search.SuggestItem&#39; resource.
    # @param search_suggest_item [SearchSuggestItem] The &#39;search.SuggestItem&#39; resource to create.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For methods that apply server-side changes, and in particular for PUT, If-Match can be used to prevent the lost update problem. It can check if the modification of a resource that the user wants to upload will not override another change that has been done since the original resource was fetched. If the request cannot be fulfilled, the 412 (Precondition Failed) response is returned. When modifying a resource using POST or PUT, the If-Match header must be set to the value of the resource ModTime property after which no lost update problem should occur. For example, a client send a GET request to obtain a resource, which includes the ModTime property. The ModTime indicates the last time the resource was created or modified. The client then sends a POST or PUT request with the If-Match header set to the ModTime property of the resource as obtained in the GET request.
    # @option opts [String] :if_none_match For methods that apply server-side changes, If-None-Match used with the * value can be used to create a resource not known to exist, guaranteeing that another resource creation didn&#39;t happen before, losing the data of the previous put. The request will be processed only if the eventually existing resource&#39;s ETag doesn&#39;t match any of the values listed. Otherwise, the status code 412 (Precondition Failed) is used. The asterisk is a special value representing any resource. It is only useful when creating a resource, usually with PUT, to check if another resource with the identity has already been created before. The comparison with the stored ETag uses the weak comparison algorithm, meaning two resources are considered identical if the content is equivalent - they don&#39;t have to be identical byte for byte.
    # @return [Array<(SearchSuggestItemResponse, Integer, Hash)>] SearchSuggestItemResponse data, response status code and response headers
    def create_search_suggest_item_with_http_info(search_suggest_item, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SearchApi.create_search_suggest_item ...'
      end
      # resource path
      local_var_path = '/api/v1/search/SuggestItems'

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
      header_params[:'If-Match'] = opts[:'if_match'] if !opts[:'if_match'].nil?
      header_params[:'If-None-Match'] = opts[:'if_none_match'] if !opts[:'if_none_match'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(search_suggest_item)

      # return_type
      return_type = opts[:debug_return_type] || 'SearchSuggestItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['cookieAuth', 'http_signature', 'oAuth2', 'oAuth2']

      new_options = opts.merge(
        :operation => :"SearchApi.create_search_suggest_item",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SearchApi#create_search_suggest_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read a 'search.SearchItem' resource.
    # @param moid [String] The unique Moid identifier of a resource instance.
    # @param [Hash] opts the optional parameters
    # @return [SearchSearchItem]
    def get_search_search_item_by_moid(moid, opts = {})
      data, _status_code, _headers = get_search_search_item_by_moid_with_http_info(moid, opts)
      data
    end

    # Read a &#39;search.SearchItem&#39; resource.
    # @param moid [String] The unique Moid identifier of a resource instance.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SearchSearchItem, Integer, Hash)>] SearchSearchItem data, response status code and response headers
    def get_search_search_item_by_moid_with_http_info(moid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SearchApi.get_search_search_item_by_moid ...'
      end
      # verify the required parameter 'moid' is set
      if @api_client.config.client_side_validation && moid.nil?
        fail ArgumentError, "Missing the required parameter 'moid' when calling SearchApi.get_search_search_item_by_moid"
      end
      # resource path
      local_var_path = '/api/v1/search/SearchItems/{Moid}'.sub('{' + 'Moid' + '}', CGI.escape(moid.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SearchSearchItem'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['cookieAuth', 'http_signature', 'oAuth2', 'oAuth2']

      new_options = opts.merge(
        :operation => :"SearchApi.get_search_search_item_by_moid",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SearchApi#get_search_search_item_by_moid\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read a 'search.SearchItem' resource.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter Filter criteria for the resources to return. A URI with a $filter query option identifies a subset of the entries from the Collection of Entries. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the $filter option. The expression language that is used in $filter queries supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false). (default to '')
    # @option opts [String] :orderby Determines what properties are used to sort the collection of resources.
    # @option opts [Integer] :top Specifies the maximum number of resources to return in the response. (default to 100)
    # @option opts [Integer] :skip Specifies the number of resources to skip in the response. (default to 0)
    # @option opts [String] :select Specifies a subset of properties to return. (default to '')
    # @option opts [String] :expand Specify additional attributes or related resources to return in addition to the primary resources.
    # @option opts [String] :apply Specify one or more transformation operations to perform aggregation on the resources. The transformations are processed in order with the output from a transformation being used as input for the subsequent transformation. The \&quot;$apply\&quot; query takes a sequence of set transformations, separated by forward slashes to express that they are consecutively applied, i.e. the result of each transformation is the input to the next transformation. Supported aggregation methods are \&quot;aggregate\&quot; and \&quot;groupby\&quot;. The **aggregate** transformation takes a comma-separated list of one or more aggregate expressions as parameters and returns a result set with a single instance, representing the aggregated value for all instances in the input set. The **groupby** transformation takes one or two parameters and 1. Splits the initial set into subsets where all instances in a subset have the same values for the grouping properties specified in the first parameter, 2. Applies set transformations to each subset according to the second parameter, resulting in a new set of potentially different structure and cardinality, 3. Ensures that the instances in the result set contain all grouping properties with the correct values for the group, 4. Concatenates the intermediate result sets into one result set. A groupby transformation affects the structure of the result set.
    # @option opts [Boolean] :count The $count query specifies the service should return the count of the matching resources, instead of returning the resources.
    # @option opts [String] :inlinecount The $inlinecount query option allows clients to request an inline count of the matching resources included with the resources in the response. (default to 'allpages')
    # @option opts [String] :at Similar to \&quot;$filter\&quot;, but \&quot;at\&quot; is specifically used to filter versioning information properties for resources to return. A URI with an \&quot;at\&quot; Query Option identifies a subset of the Entries from the Collection of Entries identified by the Resource Path section of the URI. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the query option. The expression language that is used in at operators supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false) or any of the additional literal representations shown in the Abstract Type System section.
    # @option opts [String] :tags The &#39;tags&#39; parameter is used to request a summary of the Tag utilization for this resource. When the &#39;tags&#39; parameter is specified, the response provides a list of tag keys, the number of times the key has been used across all documents, and the tag values that have been assigned to the tag key.
    # @return [SearchSearchItemResponse]
    def get_search_search_item_list(opts = {})
      data, _status_code, _headers = get_search_search_item_list_with_http_info(opts)
      data
    end

    # Read a &#39;search.SearchItem&#39; resource.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter Filter criteria for the resources to return. A URI with a $filter query option identifies a subset of the entries from the Collection of Entries. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the $filter option. The expression language that is used in $filter queries supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false).
    # @option opts [String] :orderby Determines what properties are used to sort the collection of resources.
    # @option opts [Integer] :top Specifies the maximum number of resources to return in the response.
    # @option opts [Integer] :skip Specifies the number of resources to skip in the response.
    # @option opts [String] :select Specifies a subset of properties to return.
    # @option opts [String] :expand Specify additional attributes or related resources to return in addition to the primary resources.
    # @option opts [String] :apply Specify one or more transformation operations to perform aggregation on the resources. The transformations are processed in order with the output from a transformation being used as input for the subsequent transformation. The \&quot;$apply\&quot; query takes a sequence of set transformations, separated by forward slashes to express that they are consecutively applied, i.e. the result of each transformation is the input to the next transformation. Supported aggregation methods are \&quot;aggregate\&quot; and \&quot;groupby\&quot;. The **aggregate** transformation takes a comma-separated list of one or more aggregate expressions as parameters and returns a result set with a single instance, representing the aggregated value for all instances in the input set. The **groupby** transformation takes one or two parameters and 1. Splits the initial set into subsets where all instances in a subset have the same values for the grouping properties specified in the first parameter, 2. Applies set transformations to each subset according to the second parameter, resulting in a new set of potentially different structure and cardinality, 3. Ensures that the instances in the result set contain all grouping properties with the correct values for the group, 4. Concatenates the intermediate result sets into one result set. A groupby transformation affects the structure of the result set.
    # @option opts [Boolean] :count The $count query specifies the service should return the count of the matching resources, instead of returning the resources.
    # @option opts [String] :inlinecount The $inlinecount query option allows clients to request an inline count of the matching resources included with the resources in the response.
    # @option opts [String] :at Similar to \&quot;$filter\&quot;, but \&quot;at\&quot; is specifically used to filter versioning information properties for resources to return. A URI with an \&quot;at\&quot; Query Option identifies a subset of the Entries from the Collection of Entries identified by the Resource Path section of the URI. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the query option. The expression language that is used in at operators supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false) or any of the additional literal representations shown in the Abstract Type System section.
    # @option opts [String] :tags The &#39;tags&#39; parameter is used to request a summary of the Tag utilization for this resource. When the &#39;tags&#39; parameter is specified, the response provides a list of tag keys, the number of times the key has been used across all documents, and the tag values that have been assigned to the tag key.
    # @return [Array<(SearchSearchItemResponse, Integer, Hash)>] SearchSearchItemResponse data, response status code and response headers
    def get_search_search_item_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SearchApi.get_search_search_item_list ...'
      end
      allowable_values = ["allpages", "none"]
      if @api_client.config.client_side_validation && opts[:'inlinecount'] && !allowable_values.include?(opts[:'inlinecount'])
        fail ArgumentError, "invalid value for \"inlinecount\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/v1/search/SearchItems'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'$filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'$orderby'] = opts[:'orderby'] if !opts[:'orderby'].nil?
      query_params[:'$top'] = opts[:'top'] if !opts[:'top'].nil?
      query_params[:'$skip'] = opts[:'skip'] if !opts[:'skip'].nil?
      query_params[:'$select'] = opts[:'select'] if !opts[:'select'].nil?
      query_params[:'$expand'] = opts[:'expand'] if !opts[:'expand'].nil?
      query_params[:'$apply'] = opts[:'apply'] if !opts[:'apply'].nil?
      query_params[:'$count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'$inlinecount'] = opts[:'inlinecount'] if !opts[:'inlinecount'].nil?
      query_params[:'at'] = opts[:'at'] if !opts[:'at'].nil?
      query_params[:'tags'] = opts[:'tags'] if !opts[:'tags'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SearchSearchItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['cookieAuth', 'http_signature', 'oAuth2', 'oAuth2']

      new_options = opts.merge(
        :operation => :"SearchApi.get_search_search_item_list",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SearchApi#get_search_search_item_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read a 'search.TagItem' resource.
    # @param moid [String] The unique Moid identifier of a resource instance.
    # @param [Hash] opts the optional parameters
    # @return [SearchTagItem]
    def get_search_tag_item_by_moid(moid, opts = {})
      data, _status_code, _headers = get_search_tag_item_by_moid_with_http_info(moid, opts)
      data
    end

    # Read a &#39;search.TagItem&#39; resource.
    # @param moid [String] The unique Moid identifier of a resource instance.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SearchTagItem, Integer, Hash)>] SearchTagItem data, response status code and response headers
    def get_search_tag_item_by_moid_with_http_info(moid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SearchApi.get_search_tag_item_by_moid ...'
      end
      # verify the required parameter 'moid' is set
      if @api_client.config.client_side_validation && moid.nil?
        fail ArgumentError, "Missing the required parameter 'moid' when calling SearchApi.get_search_tag_item_by_moid"
      end
      # resource path
      local_var_path = '/api/v1/search/TagItems/{Moid}'.sub('{' + 'Moid' + '}', CGI.escape(moid.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SearchTagItem'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['cookieAuth', 'http_signature', 'oAuth2', 'oAuth2']

      new_options = opts.merge(
        :operation => :"SearchApi.get_search_tag_item_by_moid",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SearchApi#get_search_tag_item_by_moid\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read a 'search.TagItem' resource.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter Filter criteria for the resources to return. A URI with a $filter query option identifies a subset of the entries from the Collection of Entries. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the $filter option. The expression language that is used in $filter queries supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false). (default to '')
    # @option opts [String] :orderby Determines what properties are used to sort the collection of resources.
    # @option opts [Integer] :top Specifies the maximum number of resources to return in the response. (default to 100)
    # @option opts [Integer] :skip Specifies the number of resources to skip in the response. (default to 0)
    # @option opts [String] :select Specifies a subset of properties to return. (default to '')
    # @option opts [String] :expand Specify additional attributes or related resources to return in addition to the primary resources.
    # @option opts [String] :apply Specify one or more transformation operations to perform aggregation on the resources. The transformations are processed in order with the output from a transformation being used as input for the subsequent transformation. The \&quot;$apply\&quot; query takes a sequence of set transformations, separated by forward slashes to express that they are consecutively applied, i.e. the result of each transformation is the input to the next transformation. Supported aggregation methods are \&quot;aggregate\&quot; and \&quot;groupby\&quot;. The **aggregate** transformation takes a comma-separated list of one or more aggregate expressions as parameters and returns a result set with a single instance, representing the aggregated value for all instances in the input set. The **groupby** transformation takes one or two parameters and 1. Splits the initial set into subsets where all instances in a subset have the same values for the grouping properties specified in the first parameter, 2. Applies set transformations to each subset according to the second parameter, resulting in a new set of potentially different structure and cardinality, 3. Ensures that the instances in the result set contain all grouping properties with the correct values for the group, 4. Concatenates the intermediate result sets into one result set. A groupby transformation affects the structure of the result set.
    # @option opts [Boolean] :count The $count query specifies the service should return the count of the matching resources, instead of returning the resources.
    # @option opts [String] :inlinecount The $inlinecount query option allows clients to request an inline count of the matching resources included with the resources in the response. (default to 'allpages')
    # @option opts [String] :at Similar to \&quot;$filter\&quot;, but \&quot;at\&quot; is specifically used to filter versioning information properties for resources to return. A URI with an \&quot;at\&quot; Query Option identifies a subset of the Entries from the Collection of Entries identified by the Resource Path section of the URI. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the query option. The expression language that is used in at operators supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false) or any of the additional literal representations shown in the Abstract Type System section.
    # @option opts [String] :tags The &#39;tags&#39; parameter is used to request a summary of the Tag utilization for this resource. When the &#39;tags&#39; parameter is specified, the response provides a list of tag keys, the number of times the key has been used across all documents, and the tag values that have been assigned to the tag key.
    # @return [SearchTagItemResponse]
    def get_search_tag_item_list(opts = {})
      data, _status_code, _headers = get_search_tag_item_list_with_http_info(opts)
      data
    end

    # Read a &#39;search.TagItem&#39; resource.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter Filter criteria for the resources to return. A URI with a $filter query option identifies a subset of the entries from the Collection of Entries. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the $filter option. The expression language that is used in $filter queries supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false).
    # @option opts [String] :orderby Determines what properties are used to sort the collection of resources.
    # @option opts [Integer] :top Specifies the maximum number of resources to return in the response.
    # @option opts [Integer] :skip Specifies the number of resources to skip in the response.
    # @option opts [String] :select Specifies a subset of properties to return.
    # @option opts [String] :expand Specify additional attributes or related resources to return in addition to the primary resources.
    # @option opts [String] :apply Specify one or more transformation operations to perform aggregation on the resources. The transformations are processed in order with the output from a transformation being used as input for the subsequent transformation. The \&quot;$apply\&quot; query takes a sequence of set transformations, separated by forward slashes to express that they are consecutively applied, i.e. the result of each transformation is the input to the next transformation. Supported aggregation methods are \&quot;aggregate\&quot; and \&quot;groupby\&quot;. The **aggregate** transformation takes a comma-separated list of one or more aggregate expressions as parameters and returns a result set with a single instance, representing the aggregated value for all instances in the input set. The **groupby** transformation takes one or two parameters and 1. Splits the initial set into subsets where all instances in a subset have the same values for the grouping properties specified in the first parameter, 2. Applies set transformations to each subset according to the second parameter, resulting in a new set of potentially different structure and cardinality, 3. Ensures that the instances in the result set contain all grouping properties with the correct values for the group, 4. Concatenates the intermediate result sets into one result set. A groupby transformation affects the structure of the result set.
    # @option opts [Boolean] :count The $count query specifies the service should return the count of the matching resources, instead of returning the resources.
    # @option opts [String] :inlinecount The $inlinecount query option allows clients to request an inline count of the matching resources included with the resources in the response.
    # @option opts [String] :at Similar to \&quot;$filter\&quot;, but \&quot;at\&quot; is specifically used to filter versioning information properties for resources to return. A URI with an \&quot;at\&quot; Query Option identifies a subset of the Entries from the Collection of Entries identified by the Resource Path section of the URI. The subset is determined by selecting only the Entries that satisfy the predicate expression specified by the query option. The expression language that is used in at operators supports references to properties and literals. The literal values can be strings enclosed in single quotes, numbers and boolean values (true or false) or any of the additional literal representations shown in the Abstract Type System section.
    # @option opts [String] :tags The &#39;tags&#39; parameter is used to request a summary of the Tag utilization for this resource. When the &#39;tags&#39; parameter is specified, the response provides a list of tag keys, the number of times the key has been used across all documents, and the tag values that have been assigned to the tag key.
    # @return [Array<(SearchTagItemResponse, Integer, Hash)>] SearchTagItemResponse data, response status code and response headers
    def get_search_tag_item_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SearchApi.get_search_tag_item_list ...'
      end
      allowable_values = ["allpages", "none"]
      if @api_client.config.client_side_validation && opts[:'inlinecount'] && !allowable_values.include?(opts[:'inlinecount'])
        fail ArgumentError, "invalid value for \"inlinecount\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/v1/search/TagItems'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'$filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'$orderby'] = opts[:'orderby'] if !opts[:'orderby'].nil?
      query_params[:'$top'] = opts[:'top'] if !opts[:'top'].nil?
      query_params[:'$skip'] = opts[:'skip'] if !opts[:'skip'].nil?
      query_params[:'$select'] = opts[:'select'] if !opts[:'select'].nil?
      query_params[:'$expand'] = opts[:'expand'] if !opts[:'expand'].nil?
      query_params[:'$apply'] = opts[:'apply'] if !opts[:'apply'].nil?
      query_params[:'$count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'$inlinecount'] = opts[:'inlinecount'] if !opts[:'inlinecount'].nil?
      query_params[:'at'] = opts[:'at'] if !opts[:'at'].nil?
      query_params[:'tags'] = opts[:'tags'] if !opts[:'tags'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SearchTagItemResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['cookieAuth', 'http_signature', 'oAuth2', 'oAuth2']

      new_options = opts.merge(
        :operation => :"SearchApi.get_search_tag_item_list",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SearchApi#get_search_tag_item_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
