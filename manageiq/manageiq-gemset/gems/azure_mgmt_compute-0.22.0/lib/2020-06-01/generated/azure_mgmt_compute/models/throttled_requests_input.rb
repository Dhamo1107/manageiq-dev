# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_06_01
  module Models
    #
    # Api request input for LogAnalytics getThrottledRequests Api.
    #
    class ThrottledRequestsInput < LogAnalyticsInputBase

      include MsRestAzure


      #
      # Mapper for ThrottledRequestsInput class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ThrottledRequestsInput',
          type: {
            name: 'Composite',
            class_name: 'ThrottledRequestsInput',
            model_properties: {
              blob_container_sas_uri: {
                client_side_validation: true,
                required: true,
                serialized_name: 'blobContainerSasUri',
                type: {
                  name: 'String'
                }
              },
              from_time: {
                client_side_validation: true,
                required: true,
                serialized_name: 'fromTime',
                type: {
                  name: 'DateTime'
                }
              },
              to_time: {
                client_side_validation: true,
                required: true,
                serialized_name: 'toTime',
                type: {
                  name: 'DateTime'
                }
              },
              group_by_throttle_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupByThrottlePolicy',
                type: {
                  name: 'Boolean'
                }
              },
              group_by_operation_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupByOperationName',
                type: {
                  name: 'Boolean'
                }
              },
              group_by_resource_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupByResourceName',
                type: {
                  name: 'Boolean'
                }
              },
              group_by_client_application_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupByClientApplicationId',
                type: {
                  name: 'Boolean'
                }
              },
              group_by_user_agent: {
                client_side_validation: true,
                required: false,
                serialized_name: 'groupByUserAgent',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
