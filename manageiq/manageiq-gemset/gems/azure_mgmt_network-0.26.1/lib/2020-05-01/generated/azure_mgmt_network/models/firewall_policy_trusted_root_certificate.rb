# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Trusted Root certificates of a firewall policy.
    #
    class FirewallPolicyTrustedRootCertificate

      include MsRestAzure

      # @return [String] Secret Id of (base-64 encoded unencrypted pfx) the
      # public certificate data stored in KeyVault.
      attr_accessor :key_vault_secret_id

      # @return [String] Name of the trusted root certificate that is unique
      # within a firewall policy.
      attr_accessor :name


      #
      # Mapper for FirewallPolicyTrustedRootCertificate class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyTrustedRootCertificate',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyTrustedRootCertificate',
            model_properties: {
              key_vault_secret_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.keyVaultSecretId',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
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
