# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_09_01
  module Models
    #
    # Rule condition of type network.
    #
    class NetworkRuleCondition < FirewallPolicyRuleCondition

      include MsRestAzure


      def initialize
        @ruleConditionType = "NetworkRuleCondition"
      end

      attr_accessor :ruleConditionType

      # @return [Array<FirewallPolicyRuleConditionNetworkProtocol>] Array of
      # FirewallPolicyRuleConditionNetworkProtocols.
      attr_accessor :ip_protocols

      # @return [Array<String>] List of source IP addresses for this rule.
      attr_accessor :source_addresses

      # @return [Array<String>] List of destination IP addresses or Service
      # Tags.
      attr_accessor :destination_addresses

      # @return [Array<String>] List of destination ports.
      attr_accessor :destination_ports


      #
      # Mapper for NetworkRuleCondition class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'NetworkRuleCondition',
          type: {
            name: 'Composite',
            class_name: 'NetworkRuleCondition',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                serialized_name: 'description',
                type: {
                  name: 'String'
                }
              },
              ruleConditionType: {
                client_side_validation: true,
                required: true,
                serialized_name: 'ruleConditionType',
                type: {
                  name: 'String'
                }
              },
              ip_protocols: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ipProtocols',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'FirewallPolicyRuleConditionNetworkProtocolElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              source_addresses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sourceAddresses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              destination_addresses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'destinationAddresses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              destination_ports: {
                client_side_validation: true,
                required: false,
                serialized_name: 'destinationPorts',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
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
