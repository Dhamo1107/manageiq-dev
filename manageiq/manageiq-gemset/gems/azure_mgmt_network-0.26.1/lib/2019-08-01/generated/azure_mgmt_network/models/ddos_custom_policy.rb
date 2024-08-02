# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_08_01
  module Models
    #
    # A DDoS custom policy in a resource group.
    #
    class DdosCustomPolicy < Resource

      include MsRestAzure

      # @return [String] The resource GUID property of the DDoS custom policy
      # resource. It uniquely identifies the resource, even if the user changes
      # its name or migrate the resource across subscriptions or resource
      # groups.
      attr_accessor :resource_guid

      # @return [ProvisioningState] The provisioning state of the DDoS custom
      # policy resource. Possible values include: 'Succeeded', 'Updating',
      # 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [Array<SubResource>] The list of public IPs associated with the
      # DDoS custom policy resource. This list is read-only.
      attr_accessor :public_ipaddresses

      # @return [Array<ProtocolCustomSettingsFormat>] The protocol-specific
      # DDoS policy customization parameters.
      attr_accessor :protocol_custom_settings

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for DdosCustomPolicy class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DdosCustomPolicy',
          type: {
            name: 'Composite',
            class_name: 'DdosCustomPolicy',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
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
              },
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              resource_guid: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.resourceGuid',
                type: {
                  name: 'String'
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
              public_ipaddresses: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.publicIPAddresses',
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
              protocol_custom_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.protocolCustomSettings',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ProtocolCustomSettingsFormatElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ProtocolCustomSettingsFormat'
                      }
                  }
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
              }
            }
          }
        }
      end
    end
  end
end
