# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2019_03_01
  module Models
    #
    # Represents a baseline metadata value.
    #
    class BaselineMetadata

      include MsRestAzure

      # @return [String] Name of the baseline metadata.
      attr_accessor :name

      # @return [String] Value of the baseline metadata.
      attr_accessor :value


      #
      # Mapper for BaselineMetadata class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'BaselineMetadata',
          type: {
            name: 'Composite',
            class_name: 'BaselineMetadata',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              value: {
                client_side_validation: true,
                required: true,
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
