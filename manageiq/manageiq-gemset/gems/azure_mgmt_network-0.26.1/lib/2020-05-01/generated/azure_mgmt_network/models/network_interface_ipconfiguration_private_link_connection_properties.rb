# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # PrivateLinkConnection properties for the network interface.
    #
    class NetworkInterfaceIPConfigurationPrivateLinkConnectionProperties

      include MsRestAzure

      # @return [String] The group ID for current private link connection.
      attr_accessor :group_id

      # @return [String] The required member name for current private link
      # connection.
      attr_accessor :required_member_name

      # @return [Array<String>] List of FQDNs for current private link
      # connection.
      attr_accessor :fqdns


      #
      # Mapper for
      # NetworkInterfaceIPConfigurationPrivateLinkConnectionProperties class as
      # Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'NetworkInterfaceIPConfigurationPrivateLinkConnectionProperties',
          type: {
            name: 'Composite',
            class_name: 'NetworkInterfaceIPConfigurationPrivateLinkConnectionProperties',
            model_properties: {
              group_id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'groupId',
                type: {
                  name: 'String'
                }
              },
              required_member_name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'requiredMemberName',
                type: {
                  name: 'String'
                }
              },
              fqdns: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'fqdns',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
