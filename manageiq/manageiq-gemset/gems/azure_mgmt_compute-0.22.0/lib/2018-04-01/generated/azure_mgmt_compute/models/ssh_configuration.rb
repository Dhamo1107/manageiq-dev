# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_04_01
  module Models
    #
    # SSH configuration for Linux based VMs running on Azure
    #
    class SshConfiguration

      include MsRestAzure

      # @return [Array<SshPublicKey>] The list of SSH public keys used to
      # authenticate with linux based VMs.
      attr_accessor :public_keys


      #
      # Mapper for SshConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SshConfiguration',
          type: {
            name: 'Composite',
            class_name: 'SshConfiguration',
            model_properties: {
              public_keys: {
                client_side_validation: true,
                required: false,
                serialized_name: 'publicKeys',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'SshPublicKeyElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'SshPublicKey'
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
