# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_03_01
  module Models
    #
    # Firewall Policy NAT Rule.
    #
    class FirewallPolicyNatRule < FirewallPolicyRule

      include MsRestAzure


      def initialize
        @ruleType = "FirewallPolicyNatRule"
      end

      attr_accessor :ruleType

      # @return [FirewallPolicyNatRuleAction] The action type of a Nat rule.
      attr_accessor :action

      # @return [String] The translated address for this NAT rule.
      attr_accessor :translated_address

      # @return [String] The translated port for this NAT rule.
      attr_accessor :translated_port

      # @return [FirewallPolicyRuleCondition] The match conditions for incoming
      # traffic.
      attr_accessor :rule_condition


      #
      # Mapper for FirewallPolicyNatRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyNatRule',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyNatRule',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              priority: {
                client_side_validation: true,
                required: false,
                serialized_name: 'priority',
                constraints: {
                  InclusiveMaximum: 65000,
                  InclusiveMinimum: 100
                },
                type: {
                  name: 'Number'
                }
              },
              ruleType: {
                client_side_validation: true,
                required: true,
                serialized_name: 'ruleType',
                type: {
                  name: 'String'
                }
              },
              action: {
                client_side_validation: true,
                required: false,
                serialized_name: 'action',
                type: {
                  name: 'Composite',
                  class_name: 'FirewallPolicyNatRuleAction'
                }
              },
              translated_address: {
                client_side_validation: true,
                required: false,
                serialized_name: 'translatedAddress',
                type: {
                  name: 'String'
                }
              },
              translated_port: {
                client_side_validation: true,
                required: false,
                serialized_name: 'translatedPort',
                type: {
                  name: 'String'
                }
              },
              rule_condition: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ruleCondition',
                type: {
                  name: 'Composite',
                  polymorphic_discriminator: 'ruleConditionType',
                  uber_parent: 'FirewallPolicyRuleCondition',
                  class_name: 'FirewallPolicyRuleCondition'
                }
              }
            }
          }
        }
      end
    end
  end
end
