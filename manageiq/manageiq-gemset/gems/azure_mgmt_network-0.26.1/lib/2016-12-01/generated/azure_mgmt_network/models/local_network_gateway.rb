# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2016_12_01
  module Models
    #
    # A common class for general resource information
    #
    class LocalNetworkGateway < Resource

      include MsRestAzure

      # @return [AddressSpace] Local network site address space.
      attr_accessor :local_network_address_space

      # @return [String] IP address of local network gateway.
      attr_accessor :gateway_ip_address

      # @return [BgpSettings] Local network gateway's BGP speaker settings.
      attr_accessor :bgp_settings

      # @return [String] The resource GUID property of the LocalNetworkGateway
      # resource.
      attr_accessor :resource_guid

      # @return [String] The provisioning state of the LocalNetworkGateway
      # resource. Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for LocalNetworkGateway class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'LocalNetworkGateway',
          type: {
            name: 'Composite',
            class_name: 'LocalNetworkGateway',
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
              local_network_address_space: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.localNetworkAddressSpace',
                type: {
                  name: 'Composite',
                  class_name: 'AddressSpace'
                }
              },
              gateway_ip_address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.gatewayIpAddress',
                type: {
                  name: 'String'
                }
              },
              bgp_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.bgpSettings',
                type: {
                  name: 'Composite',
                  class_name: 'BgpSettings'
                }
              },
              resource_guid: {
                client_side_validation: true,
                required: false,
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
