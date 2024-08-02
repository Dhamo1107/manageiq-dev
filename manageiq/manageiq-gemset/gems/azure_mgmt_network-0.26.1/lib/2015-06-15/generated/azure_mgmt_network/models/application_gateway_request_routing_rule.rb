# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2015_06_15
  module Models
    #
    # Request routing rule of an application gateway.
    #
    class ApplicationGatewayRequestRoutingRule < SubResource

      include MsRestAzure

      # @return [ApplicationGatewayRequestRoutingRuleType] Rule type. Possible
      # values are: 'Basic' and 'PathBasedRouting'. Possible values include:
      # 'Basic', 'PathBasedRouting'
      attr_accessor :rule_type

      # @return [SubResource] Backend address pool resource of the application
      # gateway.
      attr_accessor :backend_address_pool

      # @return [SubResource] Frontend port resource of the application
      # gateway.
      attr_accessor :backend_http_settings

      # @return [SubResource] Http listener resource of the application
      # gateway.
      attr_accessor :http_listener

      # @return [SubResource] URL path map resource of the application gateway.
      attr_accessor :url_path_map

      # @return [String] Provisioning state of the request routing rule
      # resource. Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] Name of the resource that is unique within a resource
      # group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for ApplicationGatewayRequestRoutingRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayRequestRoutingRule',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayRequestRoutingRule',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              rule_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.ruleType',
                type: {
                  name: 'String'
                }
              },
              backend_address_pool: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.backendAddressPool',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              backend_http_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.backendHttpSettings',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              http_listener: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.httpListener',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              url_path_map: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.urlPathMap',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
