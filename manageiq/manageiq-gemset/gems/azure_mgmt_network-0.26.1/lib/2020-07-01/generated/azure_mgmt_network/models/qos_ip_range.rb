# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # Qos Traffic Profiler IP Range properties.
    #
    class QosIpRange

      include MsRestAzure

      # @return [String] Start IP Address.
      attr_accessor :start_ip

      # @return [String] End IP Address.
      attr_accessor :end_ip


      #
      # Mapper for QosIpRange class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'QosIpRange',
          type: {
            name: 'Composite',
            class_name: 'QosIpRange',
            model_properties: {
              start_ip: {
                client_side_validation: true,
                required: false,
                serialized_name: 'startIP',
                type: {
                  name: 'String'
                }
              },
              end_ip: {
                client_side_validation: true,
                required: false,
                serialized_name: 'endIP',
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
