# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Url configuration of the Actions set in Application Gateway.
    #
    class ApplicationGatewayUrlConfiguration

      include MsRestAzure

      # @return [String] Url path which user has provided for url rewrite. Null
      # means no path will be updated. Default value is null.
      attr_accessor :modified_path

      # @return [String] Query string which user has provided for url rewrite.
      # Null means no query string will be updated. Default value is null.
      attr_accessor :modified_query_string

      # @return [Boolean] If set as true, it will re-evaluate the url path map
      # provided in path based request routing rules using modified path.
      # Default value is false.
      attr_accessor :reroute


      #
      # Mapper for ApplicationGatewayUrlConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayUrlConfiguration',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayUrlConfiguration',
            model_properties: {
              modified_path: {
                client_side_validation: true,
                required: false,
                serialized_name: 'modifiedPath',
                type: {
                  name: 'String'
                }
              },
              modified_query_string: {
                client_side_validation: true,
                required: false,
                serialized_name: 'modifiedQueryString',
                type: {
                  name: 'String'
                }
              },
              reroute: {
                client_side_validation: true,
                required: false,
                serialized_name: 'reroute',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
