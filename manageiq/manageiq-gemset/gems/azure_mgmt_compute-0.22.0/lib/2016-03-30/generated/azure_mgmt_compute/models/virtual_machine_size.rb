# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2016_03_30
  module Models
    #
    # Describes the properties of a VM size.
    #
    class VirtualMachineSize

      include MsRestAzure

      # @return [String] The name of the virtual machine size.
      attr_accessor :name

      # @return [Integer] The number of cores supported by the virtual machine
      # size.
      attr_accessor :number_of_cores

      # @return [Integer] The OS disk size, in MB, allowed by the virtual
      # machine size.
      attr_accessor :os_disk_size_in_mb

      # @return [Integer] The resource disk size, in MB, allowed by the virtual
      # machine size.
      attr_accessor :resource_disk_size_in_mb

      # @return [Integer] The amount of memory, in MB, supported by the virtual
      # machine size.
      attr_accessor :memory_in_mb

      # @return [Integer] The maximum number of data disks that can be attached
      # to the virtual machine size.
      attr_accessor :max_data_disk_count


      #
      # Mapper for VirtualMachineSize class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineSize',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineSize',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              number_of_cores: {
                client_side_validation: true,
                required: false,
                serialized_name: 'numberOfCores',
                type: {
                  name: 'Number'
                }
              },
              os_disk_size_in_mb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osDiskSizeInMB',
                type: {
                  name: 'Number'
                }
              },
              resource_disk_size_in_mb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'resourceDiskSizeInMB',
                type: {
                  name: 'Number'
                }
              },
              memory_in_mb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'memoryInMB',
                type: {
                  name: 'Number'
                }
              },
              max_data_disk_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'maxDataDiskCount',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
