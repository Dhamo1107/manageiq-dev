# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_08_01
  module Models
    #
    # The routes table associated with the ExpressRouteCircuit.
    #
    class ExpressRouteCrossConnectionRoutesTableSummary

      include MsRestAzure

      # @return [String] IP address of Neighbor router
      attr_accessor :neighbor

      # @return [Integer] Autonomous system number.
      attr_accessor :asn

      # @return [String] The length of time that the BGP session has been in
      # the Established state, or the current status if not in the Established
      # state.
      attr_accessor :up_down

      # @return [String] Current state of the BGP session, and the number of
      # prefixes that have been received from a neighbor or peer group.
      attr_accessor :state_or_prefixes_received


      #
      # Mapper for ExpressRouteCrossConnectionRoutesTableSummary class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ExpressRouteCrossConnectionRoutesTableSummary',
          type: {
            name: 'Composite',
            class_name: 'ExpressRouteCrossConnectionRoutesTableSummary',
            model_properties: {
              neighbor: {
                client_side_validation: true,
                required: false,
                serialized_name: 'neighbor',
                type: {
                  name: 'String'
                }
              },
              asn: {
                client_side_validation: true,
                required: false,
                serialized_name: 'asn',
                type: {
                  name: 'Number'
                }
              },
              up_down: {
                client_side_validation: true,
                required: false,
                serialized_name: 'upDown',
                type: {
                  name: 'String'
                }
              },
              state_or_prefixes_received: {
                client_side_validation: true,
                required: false,
                serialized_name: 'stateOrPrefixesReceived',
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
