# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2016_03_01
  module Models
    #
    # Specifies the action to post to service when the rule condition is
    # evaluated. The discriminator is always RuleWebhookAction in this case.
    #
    class RuleWebhookAction < RuleAction

      include MsRestAzure


      def initialize
        @odatatype = "Microsoft.Azure.Management.Insights.Models.RuleWebhookAction"
      end

      attr_accessor :odatatype

      # @return [String] the service uri to Post the notification when the
      # alert activates or resolves.
      attr_accessor :service_uri

      # @return [Hash{String => String}] the dictionary of custom properties to
      # include with the post operation. These data are appended to the webhook
      # payload.
      attr_accessor :properties


      #
      # Mapper for RuleWebhookAction class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'Microsoft.Azure.Management.Insights.Models.RuleWebhookAction',
          type: {
            name: 'Composite',
            class_name: 'RuleWebhookAction',
            model_properties: {
              odatatype: {
                client_side_validation: true,
                required: true,
                serialized_name: 'odata\\.type',
                type: {
                  name: 'String'
                }
              },
              service_uri: {
                client_side_validation: true,
                required: false,
                serialized_name: 'serviceUri',
                type: {
                  name: 'String'
                }
              },
              properties: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties',
                type: {
                  name: 'Dictionary',
                  value: {
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
