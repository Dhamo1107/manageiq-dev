# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_06_01
  module Models
    #
    # Rule Collection Group resource.
    #
    class FirewallPolicyRuleCollectionGroup < SubResource

      include MsRestAzure

      # @return [Integer] Priority of the Firewall Policy Rule Collection Group
      # resource.
      attr_accessor :priority

      # @return [Array<FirewallPolicyRuleCollection>] Group of Firewall Policy
      # rule collections.
      attr_accessor :rule_collections

      # @return [ProvisioningState] The provisioning state of the firewall
      # policy rule collection group resource. Possible values include:
      # 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [String] The name of the resource that is unique within a
      # resource group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Rule Group type.
      attr_accessor :type


      #
      # Mapper for FirewallPolicyRuleCollectionGroup class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyRuleCollectionGroup',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyRuleCollectionGroup',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              priority: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.priority',
                constraints: {
                  InclusiveMaximum: 65000,
                  InclusiveMinimum: 100
                },
                type: {
                  name: 'Number'
                }
              },
              rule_collections: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.ruleCollections',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'FirewallPolicyRuleCollectionElementType',
                      type: {
                        name: 'Composite',
                        polymorphic_discriminator: 'ruleCollectionType',
                        uber_parent: 'FirewallPolicyRuleCollection',
                        class_name: 'FirewallPolicyRuleCollection'
                      }
                  }
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
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
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
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
              }
            }
          }
        }
      end
    end
  end
end
