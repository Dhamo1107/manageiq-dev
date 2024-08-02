# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_12_01
  module Models
    #
    # Specifies information about the availability set that the virtual machine
    # should be assigned to. Virtual machines specified in the same
    # availability set are allocated to different nodes to maximize
    # availability. For more information about availability sets, see [Manage
    # the availability of virtual
    # machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json).
    # <br><br> For more information on Azure planned maintenance, see [Planned
    # maintenance for virtual machines in
    # Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-planned-maintenance?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
    # <br><br> Currently, a VM can only be added to availability set at
    # creation time. An existing VM cannot be added to an availability set.
    #
    class AvailabilitySet < Resource

      include MsRestAzure

      # @return [Integer] Update Domain count.
      attr_accessor :platform_update_domain_count

      # @return [Integer] Fault Domain count.
      attr_accessor :platform_fault_domain_count

      # @return [Array<SubResource>] A list of references to all virtual
      # machines in the availability set.
      attr_accessor :virtual_machines

      # @return [SubResource] Specifies information about the proximity
      # placement group that the availability set should be assigned to.
      # <br><br>Minimum api-version: 2018-04-01.
      attr_accessor :proximity_placement_group

      # @return [Array<InstanceViewStatus>] The resource status information.
      attr_accessor :statuses

      # @return [Sku] Sku of the availability set, only name is required to be
      # set. See AvailabilitySetSkuTypes for possible set of values. Use
      # 'Aligned' for virtual machines with managed disks and 'Classic' for
      # virtual machines with unmanaged disks. Default value is 'Classic'.
      attr_accessor :sku


      #
      # Mapper for AvailabilitySet class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AvailabilitySet',
          type: {
            name: 'Composite',
            class_name: 'AvailabilitySet',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: true,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              platform_update_domain_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.platformUpdateDomainCount',
                type: {
                  name: 'Number'
                }
              },
              platform_fault_domain_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.platformFaultDomainCount',
                type: {
                  name: 'Number'
                }
              },
              virtual_machines: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.virtualMachines',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'SubResourceElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'SubResource'
                      }
                  }
                }
              },
              proximity_placement_group: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.proximityPlacementGroup',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              statuses: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.statuses',
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
              },
              sku: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sku',
                type: {
                  name: 'Composite',
                  class_name: 'Sku'
                }
              }
            }
          }
        }
      end
    end
  end
end
