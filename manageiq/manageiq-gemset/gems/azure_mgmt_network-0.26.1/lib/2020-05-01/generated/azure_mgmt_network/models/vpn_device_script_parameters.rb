# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Vpn device configuration script generation parameters.
    #
    class VpnDeviceScriptParameters

      include MsRestAzure

      # @return [String] The vendor for the vpn device.
      attr_accessor :vendor

      # @return [String] The device family for the vpn device.
      attr_accessor :device_family

      # @return [String] The firmware version for the vpn device.
      attr_accessor :firmware_version


      #
      # Mapper for VpnDeviceScriptParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VpnDeviceScriptParameters',
          type: {
            name: 'Composite',
            class_name: 'VpnDeviceScriptParameters',
            model_properties: {
              vendor: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vendor',
                type: {
                  name: 'String'
                }
              },
              device_family: {
                client_side_validation: true,
                required: false,
                serialized_name: 'deviceFamily',
                type: {
                  name: 'String'
                }
              },
              firmware_version: {
                client_side_validation: true,
                required: false,
                serialized_name: 'firmwareVersion',
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
