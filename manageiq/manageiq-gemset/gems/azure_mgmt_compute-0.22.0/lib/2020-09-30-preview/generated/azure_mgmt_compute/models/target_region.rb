# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_09_30_preview
  module Models
    #
    # Describes the target region information.
    #
    class TargetRegion

      include MsRestAzure

      # @return [String] The name of the region.
      attr_accessor :name

      # @return [Integer] The number of replicas of the Image Version to be
      # created per region. This property is updatable.
      attr_accessor :regional_replica_count

      # @return [StorageAccountType] Specifies the storage account type to be
      # used to store the image. This property is not updatable. Possible
      # values include: 'Standard_LRS', 'Standard_ZRS', 'Premium_LRS'
      attr_accessor :storage_account_type

      # @return [EncryptionImages]
      attr_accessor :encryption


      #
      # Mapper for TargetRegion class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'TargetRegion',
          type: {
            name: 'Composite',
            class_name: 'TargetRegion',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              regional_replica_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'regionalReplicaCount',
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
              encryption: {
                client_side_validation: true,
                required: false,
                serialized_name: 'encryption',
                type: {
                  name: 'Composite',
                  class_name: 'EncryptionImages'
                }
              }
            }
          }
        }
      end
    end
  end
end
