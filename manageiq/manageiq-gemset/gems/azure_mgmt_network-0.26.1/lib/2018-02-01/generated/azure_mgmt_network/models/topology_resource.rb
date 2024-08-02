# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_02_01
  module Models
    #
    # The network resource topology information for the given resource group.
    #
    class TopologyResource

      include MsRestAzure

      # @return [String] Name of the resource.
      attr_accessor :name

      # @return [String] ID of the resource.
      attr_accessor :id

      # @return [String] Resource location.
      attr_accessor :location

      # @return [Array<TopologyAssociation>] Holds the associations the
      # resource has with other resources in the resource group.
      attr_accessor :associations


      #
      # Mapper for TopologyResource class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'TopologyResource',
          type: {
            name: 'Composite',
            class_name: 'TopologyResource',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              associations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'associations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'TopologyAssociationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'TopologyAssociation'
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
