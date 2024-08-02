# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # VpnSiteLink Resource.
    #
    class VpnSiteLink < SubResource

      include MsRestAzure

      # @return [VpnLinkProviderProperties] The link provider properties.
      attr_accessor :link_properties

      # @return [String] The ip-address for the vpn-site-link.
      attr_accessor :ip_address

      # @return [String] FQDN of vpn-site-link.
      attr_accessor :fqdn

      # @return [VpnLinkBgpSettings] The set of bgp properties.
      attr_accessor :bgp_properties

      # @return [ProvisioningState] The provisioning state of the VPN site link
      # resource. Possible values include: 'Succeeded', 'Updating', 'Deleting',
      # 'Failed'
      attr_accessor :provisioning_state

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] The name of the resource that is unique within a
      # resource group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] Resource type.
      attr_accessor :type


      #
      # Mapper for VpnSiteLink class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VpnSiteLink',
          type: {
            name: 'Composite',
            class_name: 'VpnSiteLink',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              link_properties: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.linkProperties',
                type: {
                  name: 'Composite',
                  class_name: 'VpnLinkProviderProperties'
                }
              },
              ip_address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.ipAddress',
                type: {
                  name: 'String'
                }
              },
              fqdn: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.fqdn',
                type: {
                  name: 'String'
                }
              },
              bgp_properties: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.bgpProperties',
                type: {
                  name: 'Composite',
                  class_name: 'VpnLinkBgpSettings'
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
                read_only: true,
                serialized_name: 'etag',
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
