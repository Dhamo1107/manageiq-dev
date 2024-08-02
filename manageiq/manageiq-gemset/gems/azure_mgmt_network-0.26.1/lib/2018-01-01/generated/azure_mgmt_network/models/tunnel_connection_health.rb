# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_01_01
  module Models
    #
    # VirtualNetworkGatewayConnection properties
    #
    class TunnelConnectionHealth

      include MsRestAzure

      # @return [String] Tunnel name.
      attr_accessor :tunnel

      # @return [VirtualNetworkGatewayConnectionStatus] Virtual network Gateway
      # connection status. Possible values include: 'Unknown', 'Connecting',
      # 'Connected', 'NotConnected'
      attr_accessor :connection_status

      # @return [Integer] The Ingress Bytes Transferred in this connection
      attr_accessor :ingress_bytes_transferred

      # @return [Integer] The Egress Bytes Transferred in this connection
      attr_accessor :egress_bytes_transferred

      # @return [String] The time at which connection was established in Utc
      # format.
      attr_accessor :last_connection_established_utc_time


      #
      # Mapper for TunnelConnectionHealth class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'TunnelConnectionHealth',
          type: {
            name: 'Composite',
            class_name: 'TunnelConnectionHealth',
            model_properties: {
              tunnel: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'tunnel',
                type: {
                  name: 'String'
                }
              },
              connection_status: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'connectionStatus',
                type: {
                  name: 'String'
                }
              },
              ingress_bytes_transferred: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'ingressBytesTransferred',
                type: {
                  name: 'Number'
                }
              },
              egress_bytes_transferred: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'egressBytesTransferred',
                type: {
                  name: 'Number'
                }
              },
              last_connection_established_utc_time: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'lastConnectionEstablishedUtcTime',
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
