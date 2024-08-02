# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_12_01
  module Models
    #
    # Describes an Operating System disk.
    #
    class ImageOSDisk < ImageDisk

      include MsRestAzure

      # @return [OperatingSystemTypes] This property allows you to specify the
      # type of the OS that is included in the disk if creating a VM from a
      # custom image. <br><br> Possible values are: <br><br> **Windows**
      # <br><br> **Linux**. Possible values include: 'Windows', 'Linux'
      attr_accessor :os_type

      # @return [OperatingSystemStateTypes] The OS State. Possible values
      # include: 'Generalized', 'Specialized'
      attr_accessor :os_state


      #
      # Mapper for ImageOSDisk class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ImageOSDisk',
          type: {
            name: 'Composite',
            class_name: 'ImageOSDisk',
            model_properties: {
              snapshot: {
                client_side_validation: true,
                required: false,
                serialized_name: 'snapshot',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              managed_disk: {
                client_side_validation: true,
                required: false,
                serialized_name: 'managedDisk',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              blob_uri: {
                client_side_validation: true,
                required: false,
                serialized_name: 'blobUri',
                type: {
                  name: 'String'
                }
              },
              caching: {
                client_side_validation: true,
                required: false,
                serialized_name: 'caching',
                type: {
                  name: 'Enum',
                  module: 'CachingTypes'
                }
              },
              disk_size_gb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diskSizeGB',
                type: {
                  name: 'Number'
                }
              },
              storage_account_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'storageAccountType',
                type: {
                  name: 'String'
                }
              },
              disk_encryption_set: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diskEncryptionSet',
                type: {
                  name: 'Composite',
                  class_name: 'DiskEncryptionSetParameters'
                }
              },
              os_type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemTypes'
                }
              },
              os_state: {
                client_side_validation: true,
                required: true,
                serialized_name: 'osState',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemStateTypes'
                }
              }
            }
          }
        }
      end
    end
  end
end
