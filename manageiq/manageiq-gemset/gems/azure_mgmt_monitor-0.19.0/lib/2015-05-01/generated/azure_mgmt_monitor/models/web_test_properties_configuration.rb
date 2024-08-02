# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2015_05_01
  module Models
    #
    # An XML configuration specification for a WebTest.
    #
    class WebTestPropertiesConfiguration

      include MsRestAzure

      # @return [String] The XML specification of a WebTest to run against an
      # application.
      attr_accessor :web_test


      #
      # Mapper for WebTestPropertiesConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'WebTestProperties_Configuration',
          type: {
            name: 'Composite',
            class_name: 'WebTestPropertiesConfiguration',
            model_properties: {
              web_test: {
                client_side_validation: true,
                required: false,
                serialized_name: 'WebTest',
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
