# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_12_01
  module Models
    #
    # Contains SKU in an ExpressRouteCircuit.
    #
    class ExpressRouteCircuitSku

      include MsRestAzure

      # @return [String] The name of the SKU.
      attr_accessor :name

      # @return [ExpressRouteCircuitSkuTier] The tier of the SKU. Possible
      # values include: 'Standard', 'Premium', 'Basic', 'Local'
      attr_accessor :tier

      # @return [ExpressRouteCircuitSkuFamily] The family of the SKU. Possible
      # values include: 'UnlimitedData', 'MeteredData'
      attr_accessor :family


      #
      # Mapper for ExpressRouteCircuitSku class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ExpressRouteCircuitSku',
          type: {
            name: 'Composite',
            class_name: 'ExpressRouteCircuitSku',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              tier: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tier',
                type: {
                  name: 'String'
                }
              },
              family: {
                client_side_validation: true,
                required: false,
                serialized_name: 'family',
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
