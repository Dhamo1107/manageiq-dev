# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2019_03_01
  module Models
    #
    # Api error.
    #
    class ApiError

      include MsRestAzure

      # @return [Array<ApiErrorBase>] The Api error details
      attr_accessor :details

      # @return [InnerError] The Api inner error
      attr_accessor :innererror

      # @return [String] The error code.
      attr_accessor :code

      # @return [String] The target of the particular error.
      attr_accessor :target

      # @return [String] The error message.
      attr_accessor :message


      #
      # Mapper for ApiError class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApiError',
          type: {
            name: 'Composite',
            class_name: 'ApiError',
            model_properties: {
              details: {
                client_side_validation: true,
                required: false,
                serialized_name: 'details',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApiErrorBaseElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApiErrorBase'
                      }
                  }
                }
              },
              innererror: {
                client_side_validation: true,
                required: false,
                serialized_name: 'innererror',
                type: {
                  name: 'Composite',
                  class_name: 'InnerError'
                }
              },
              code: {
                client_side_validation: true,
                required: false,
                serialized_name: 'code',
                type: {
                  name: 'String'
                }
              },
              target: {
                client_side_validation: true,
                required: false,
                serialized_name: 'target',
                type: {
                  name: 'String'
                }
              },
              message: {
                client_side_validation: true,
                required: false,
                serialized_name: 'message',
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
