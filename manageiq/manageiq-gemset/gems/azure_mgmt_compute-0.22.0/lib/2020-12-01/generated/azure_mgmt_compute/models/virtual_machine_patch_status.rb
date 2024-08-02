# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_12_01
  module Models
    #
    # The status of virtual machine patch operations.
    #
    class VirtualMachinePatchStatus

      include MsRestAzure

      # @return [AvailablePatchSummary] The available patch summary of the
      # latest assessment operation for the virtual machine.
      attr_accessor :available_patch_summary

      # @return [LastPatchInstallationSummary] The installation summary of the
      # latest installation operation for the virtual machine.
      attr_accessor :last_patch_installation_summary

      # @return [Array<InstanceViewStatus>] The enablement status of the
      # specified patchMode
      attr_accessor :configuration_statuses


      #
      # Mapper for VirtualMachinePatchStatus class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachinePatchStatus',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachinePatchStatus',
            model_properties: {
              available_patch_summary: {
                client_side_validation: true,
                required: false,
                serialized_name: 'availablePatchSummary',
                type: {
                  name: 'Composite',
                  class_name: 'AvailablePatchSummary'
                }
              },
              last_patch_installation_summary: {
                client_side_validation: true,
                required: false,
                serialized_name: 'lastPatchInstallationSummary',
                type: {
                  name: 'Composite',
                  class_name: 'LastPatchInstallationSummary'
                }
              },
              configuration_statuses: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'configurationStatuses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'InstanceViewStatusElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'InstanceViewStatus'
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
