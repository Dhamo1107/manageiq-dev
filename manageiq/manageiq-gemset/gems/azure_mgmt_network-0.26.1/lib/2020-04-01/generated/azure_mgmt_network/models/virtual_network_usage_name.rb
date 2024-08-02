# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_04_01
  module Models
    #
    # Usage strings container.
    #
    class VirtualNetworkUsageName

      include MsRestAzure

      # @return [String] Localized subnet size and usage string.
      attr_accessor :localized_value

      # @return [String] Subnet size and usage string.
      attr_accessor :value


      #
      # Mapper for VirtualNetworkUsageName class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualNetworkUsageName',
          type: {
            name: 'Composite',
            class_name: 'VirtualNetworkUsageName',
            model_properties: {
              localized_value: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'localizedValue',
                type: {
                  name: 'String'
                }
              },
              value: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'value',
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
