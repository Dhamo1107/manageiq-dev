# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_09_01
  module Models
    #
    # Properties of the application rule protocol.
    #
    class FirewallPolicyRuleConditionApplicationProtocol

      include MsRestAzure

      # @return [FirewallPolicyRuleConditionApplicationProtocolType] Protocol
      # type. Possible values include: 'Http', 'Https'
      attr_accessor :protocol_type

      # @return [Integer] Port number for the protocol, cannot be greater than
      # 64000.
      attr_accessor :port


      #
      # Mapper for FirewallPolicyRuleConditionApplicationProtocol class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyRuleConditionApplicationProtocol',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyRuleConditionApplicationProtocol',
            model_properties: {
              protocol_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'protocolType',
                type: {
                  name: 'String'
                }
              },
              port: {
                client_side_validation: true,
                required: false,
                serialized_name: 'port',
                constraints: {
                  InclusiveMaximum: 64000,
                  InclusiveMinimum: 0
                },
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
