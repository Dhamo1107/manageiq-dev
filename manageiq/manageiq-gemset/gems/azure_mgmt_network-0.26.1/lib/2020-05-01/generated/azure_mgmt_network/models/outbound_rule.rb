# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Outbound rule of the load balancer.
    #
    class OutboundRule < SubResource

      include MsRestAzure

      # @return [Integer] The number of outbound ports to be used for NAT.
      attr_accessor :allocated_outbound_ports

      # @return [Array<SubResource>] The Frontend IP addresses of the load
      # balancer.
      attr_accessor :frontend_ipconfigurations

      # @return [SubResource] A reference to a pool of DIPs. Outbound traffic
      # is randomly load balanced across IPs in the backend IPs.
      attr_accessor :backend_address_pool

      # @return [ProvisioningState] The provisioning state of the outbound rule
      # resource. Possible values include: 'Succeeded', 'Updating', 'Deleting',
      # 'Failed'
      attr_accessor :provisioning_state

      # @return [LoadBalancerOutboundRuleProtocol] The protocol for the
      # outbound rule in load balancer. Possible values include: 'Tcp', 'Udp',
      # 'All'
      attr_accessor :protocol

      # @return [Boolean] Receive bidirectional TCP Reset on TCP flow idle
      # timeout or unexpected connection termination. This element is only used
      # when the protocol is set to TCP.
      attr_accessor :enable_tcp_reset

      # @return [Integer] The timeout for the TCP idle connection.
      attr_accessor :idle_timeout_in_minutes

      # @return [String] The name of the resource that is unique within the set
      # of outbound rules used by the load balancer. This name can be used to
      # access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Type of the resource.
      attr_accessor :type


      #
      # Mapper for OutboundRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'OutboundRule',
          type: {
            name: 'Composite',
            class_name: 'OutboundRule',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              allocated_outbound_ports: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.allocatedOutboundPorts',
                type: {
                  name: 'Number'
                }
              },
              frontend_ipconfigurations: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.frontendIPConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'SubResourceElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'SubResource'
                      }
                  }
                }
              },
              backend_address_pool: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.backendAddressPool',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              protocol: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.protocol',
                type: {
                  name: 'String'
                }
              },
              enable_tcp_reset: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.enableTcpReset',
                type: {
                  name: 'Boolean'
                }
              },
              idle_timeout_in_minutes: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.idleTimeoutInMinutes',
                type: {
                  name: 'Number'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
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
