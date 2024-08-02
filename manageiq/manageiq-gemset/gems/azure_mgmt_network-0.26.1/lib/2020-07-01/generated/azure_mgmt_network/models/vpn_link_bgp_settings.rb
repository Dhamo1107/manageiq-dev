# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # BGP settings details for a link.
    #
    class VpnLinkBgpSettings

      include MsRestAzure

      # @return [Integer] The BGP speaker's ASN.
      attr_accessor :asn

      # @return [String] The BGP peering address and BGP identifier of this BGP
      # speaker.
      attr_accessor :bgp_peering_address


      #
      # Mapper for VpnLinkBgpSettings class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VpnLinkBgpSettings',
          type: {
            name: 'Composite',
            class_name: 'VpnLinkBgpSettings',
            model_properties: {
              asn: {
                client_side_validation: true,
                required: false,
                serialized_name: 'asn',
                type: {
                  name: 'Number'
                }
              },
              bgp_peering_address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'bgpPeeringAddress',
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
