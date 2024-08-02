# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Vpn Client Parameters for package generation.
    #
    class P2SVpnProfileParameters

      include MsRestAzure

      # @return [AuthenticationMethod] VPN client authentication method.
      # Possible values include: 'EAPTLS', 'EAPMSCHAPv2'
      attr_accessor :authentication_method


      #
      # Mapper for P2SVpnProfileParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'P2SVpnProfileParameters',
          type: {
            name: 'Composite',
            class_name: 'P2SVpnProfileParameters',
            model_properties: {
              authentication_method: {
                client_side_validation: true,
                required: false,
                serialized_name: 'authenticationMethod',
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
