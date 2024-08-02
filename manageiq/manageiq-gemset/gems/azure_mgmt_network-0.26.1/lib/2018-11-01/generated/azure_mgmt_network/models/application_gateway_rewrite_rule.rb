# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_11_01
  module Models
    #
    # Rewrite rule of an application gateway.
    #
    class ApplicationGatewayRewriteRule

      include MsRestAzure

      # @return [String] Name of the rewrite rule that is unique within an
      # Application Gateway.
      attr_accessor :name

      # @return [ApplicationGatewayRewriteRuleActionSet] Set of actions to be
      # done as part of the rewrite Rule.
      attr_accessor :action_set


      #
      # Mapper for ApplicationGatewayRewriteRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayRewriteRule',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayRewriteRule',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              action_set: {
                client_side_validation: true,
                required: false,
                serialized_name: 'actionSet',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayRewriteRuleActionSet'
                }
              }
            }
          }
        }
      end
    end
  end
end
