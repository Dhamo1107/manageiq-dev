# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # SSL profile of an application gateway.
    #
    class ApplicationGatewaySslProfile < SubResource

      include MsRestAzure

      # @return [Array<SubResource>] Array of references to application gateway
      # trusted client certificates.
      attr_accessor :trusted_client_certificates

      # @return [ApplicationGatewaySslPolicy] SSL policy of the application
      # gateway resource.
      attr_accessor :ssl_policy

      # @return [ApplicationGatewayClientAuthConfiguration] Client
      # authentication configuration of the application gateway resource.
      attr_accessor :client_auth_configuration

      # @return [ProvisioningState] The provisioning state of the HTTP listener
      # resource. Possible values include: 'Succeeded', 'Updating', 'Deleting',
      # 'Failed'
      attr_accessor :provisioning_state

      # @return [String] Name of the SSL profile that is unique within an
      # Application Gateway.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Type of the resource.
      attr_accessor :type


      #
      # Mapper for ApplicationGatewaySslProfile class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewaySslProfile',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewaySslProfile',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              trusted_client_certificates: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.trustedClientCertificates',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'SubResourceElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'SubResource'
                      }
                  }
                }
              },
              ssl_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.sslPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewaySslPolicy'
                }
              },
              client_auth_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.clientAuthConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayClientAuthConfiguration'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
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
                read_only: true,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
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
