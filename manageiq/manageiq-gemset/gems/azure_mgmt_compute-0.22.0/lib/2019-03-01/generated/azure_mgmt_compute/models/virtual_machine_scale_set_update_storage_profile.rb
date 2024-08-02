# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2019_03_01
  module Models
    #
    # Describes a virtual machine scale set storage profile.
    #
    class VirtualMachineScaleSetUpdateStorageProfile

      include MsRestAzure

      # @return [ImageReference] The image reference.
      attr_accessor :image_reference

      # @return [VirtualMachineScaleSetUpdateOSDisk] The OS disk.
      attr_accessor :os_disk

      # @return [Array<VirtualMachineScaleSetDataDisk>] The data disks.
      attr_accessor :data_disks


      #
      # Mapper for VirtualMachineScaleSetUpdateStorageProfile class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetUpdateStorageProfile',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetUpdateStorageProfile',
            model_properties: {
              image_reference: {
                client_side_validation: true,
                required: false,
                serialized_name: 'imageReference',
                type: {
                  name: 'Composite',
                  class_name: 'ImageReference'
                }
              },
              os_disk: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osDisk',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetUpdateOSDisk'
                }
              },
              data_disks: {
                client_side_validation: true,
                required: false,
                serialized_name: 'dataDisks',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineScaleSetDataDiskElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineScaleSetDataDisk'
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
