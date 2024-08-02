# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2015_05_01
  module Models
    #
    # An Application Insights component daily data volume cap status
    #
    class ApplicationInsightsComponentQuotaStatus

      include MsRestAzure

      # @return [String] The Application ID for the Application Insights
      # component.
      attr_accessor :app_id

      # @return [Boolean] The daily data volume cap is met, and data ingestion
      # will be stopped.
      attr_accessor :should_be_throttled

      # @return [String] Date and time when the daily data volume cap will be
      # reset, and data ingestion will resume.
      attr_accessor :expiration_time


      #
      # Mapper for ApplicationInsightsComponentQuotaStatus class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationInsightsComponentQuotaStatus',
          type: {
            name: 'Composite',
            class_name: 'ApplicationInsightsComponentQuotaStatus',
            model_properties: {
              app_id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'AppId',
                type: {
                  name: 'String'
                }
              },
              should_be_throttled: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'ShouldBeThrottled',
                type: {
                  name: 'Boolean'
                }
              },
              expiration_time: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'ExpirationTime',
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
