# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Resources::Mgmt::V2019_10_01
  module Models
    #
    # Export resource group template request parameters.
    #
    class ExportTemplateRequest

      include MsRestAzure

      # @return [Array<String>] The IDs of the resources to filter the export
      # by. To export all resources, supply an array with single entry '*'.
      attr_accessor :resources

      # @return [String] The export template options. A CSV-formatted list
      # containing zero or more of the following:
      # 'IncludeParameterDefaultValue', 'IncludeComments',
      # 'SkipResourceNameParameterization', 'SkipAllParameterization'
      attr_accessor :options


      #
      # Mapper for ExportTemplateRequest class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ExportTemplateRequest',
          type: {
            name: 'Composite',
            class_name: 'ExportTemplateRequest',
            model_properties: {
              resources: {
                client_side_validation: true,
                required: false,
                serialized_name: 'resources',
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
              options: {
                client_side_validation: true,
                required: false,
                serialized_name: 'options',
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
