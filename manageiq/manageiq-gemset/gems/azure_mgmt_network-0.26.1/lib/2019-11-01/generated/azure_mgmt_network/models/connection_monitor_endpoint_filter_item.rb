# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_11_01
  module Models
    #
    # Describes the connection monitor endpoint filter item.
    #
    class ConnectionMonitorEndpointFilterItem

      include MsRestAzure

      # @return [ConnectionMonitorEndpointFilterItemType] The type of item
      # included in the filter. Currently only 'AgentAddress' is supported.
      # Possible values include: 'AgentAddress'
      attr_accessor :type

      # @return [String] The address of the filter item.
      attr_accessor :address


      #
      # Mapper for ConnectionMonitorEndpointFilterItem class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ConnectionMonitorEndpointFilterItem',
          type: {
            name: 'Composite',
            class_name: 'ConnectionMonitorEndpointFilterItem',
            model_properties: {
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'address',
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
