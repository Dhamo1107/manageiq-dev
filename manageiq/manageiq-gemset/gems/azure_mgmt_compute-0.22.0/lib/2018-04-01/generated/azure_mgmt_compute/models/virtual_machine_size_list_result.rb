# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_04_01
  module Models
    #
    # The List Virtual Machine operation response.
    #
    class VirtualMachineSizeListResult

      include MsRestAzure

      # @return [Array<VirtualMachineSize>] The list of virtual machine sizes.
      attr_accessor :value


      #
      # Mapper for VirtualMachineSizeListResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineSizeListResult',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineSizeListResult',
            model_properties: {
              value: {
                client_side_validation: true,
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineSizeElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineSize'
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
