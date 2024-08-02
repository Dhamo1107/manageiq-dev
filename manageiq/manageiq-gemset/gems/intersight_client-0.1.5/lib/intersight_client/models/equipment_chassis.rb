=begin
#Cisco Intersight

#Cisco Intersight is a management platform delivered as a service with embedded analytics for your Cisco and 3rd party IT infrastructure. This platform offers an intelligent level of management that enables IT organizations to analyze, simplify, and automate their environments in more advanced ways than the prior generations of tools. Cisco Intersight provides an integrated and intuitive management experience for resources in the traditional data center as well as at the edge. With flexible deployment options to address complex security needs, getting started with Intersight is quick and easy. Cisco Intersight has deep integration with Cisco UCS and HyperFlex systems allowing for remote deployment, configuration, and ongoing maintenance. The model-based deployment works for a single system in a remote location or hundreds of systems in a data center and enables rapid, standardized configuration and deployment. It also streamlines maintaining those systems whether you are working with small or very large configurations. The Intersight OpenAPI document defines the complete set of properties that are returned in the HTTP response. From that perspective, a client can expect that no additional properties are returned, unless these properties are explicitly defined in the OpenAPI document. However, when a client uses an older version of the Intersight OpenAPI document, the server may send additional properties because the software is more recent than the client. In that case, the client may receive properties that it does not know about. Some generated SDKs perform a strict validation of the HTTP response body against the OpenAPI document. This document was created on 2021-10-20T11:22:53Z.

The version of the OpenAPI document: 1.0.9-4870
Contact: intersight@cisco.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module IntersightClient
  # A physical holder housing blade servers.
  class EquipmentChassis < EquipmentBase
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    attr_accessor :alarm_summary

    # The assigned identifier for a chassis.
    attr_accessor :chassis_id

    # This field identifies the connectivity path for the chassis enclosure.
    attr_accessor :connection_path

    # This field identifies the connectivity status for the chassis enclosure.
    attr_accessor :connection_status

    # This field is to provide description for chassis model.
    attr_accessor :description

    # This field summarizes the faults on the chassis enclosure.
    attr_accessor :fault_summary

    # The management mode of the blade server chassis. * `IntersightStandalone` - Intersight Standalone mode of operation. * `UCSM` - Unified Computing System Manager mode of operation. * `Intersight` - Intersight managed mode of operation.
    attr_accessor :management_mode

    # This field identifies the name for the chassis enclosure.
    attr_accessor :name

    attr_accessor :oper_reason

    # This field identifies the Chassis Operational State.
    attr_accessor :oper_state

    # Part Number identifier for the chassis enclosure.
    attr_accessor :part_number

    # This field identifies the Product ID for the chassis enclosure.
    attr_accessor :pid

    # The platform type that the chassis is a part of.
    attr_accessor :platform_type

    # This field identifies the Product Name for the chassis enclosure.
    attr_accessor :product_name

    # This field identifies the Stock Keeping Unit for the chassis enclosure.
    attr_accessor :sku

    # This field identifies the Vendor ID for the chassis enclosure.
    attr_accessor :vid

    # An array of relationships to computeBlade resources.
    attr_accessor :blades

    # An array of relationships to equipmentExpanderModule resources.
    attr_accessor :expander_modules

    attr_accessor :fan_control

    # An array of relationships to equipmentFanModule resources.
    attr_accessor :fanmodules

    attr_accessor :inventory_device_info

    # An array of relationships to equipmentIoCard resources.
    attr_accessor :ioms

    attr_accessor :locator_led

    attr_accessor :power_control_state

    attr_accessor :psu_control

    # An array of relationships to equipmentPsu resources.
    attr_accessor :psus

    attr_accessor :registered_device

    # An array of relationships to storageSasExpander resources.
    attr_accessor :sasexpanders

    # An array of relationships to equipmentSystemIoController resources.
    attr_accessor :siocs

    # An array of relationships to storageEnclosure resources.
    attr_accessor :storage_enclosures

    # An array of relationships to storageVirtualDriveContainer resources.
    attr_accessor :virtual_drive_container

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'class_id' => :'ClassId',
        :'object_type' => :'ObjectType',
        :'alarm_summary' => :'AlarmSummary',
        :'chassis_id' => :'ChassisId',
        :'connection_path' => :'ConnectionPath',
        :'connection_status' => :'ConnectionStatus',
        :'description' => :'Description',
        :'fault_summary' => :'FaultSummary',
        :'management_mode' => :'ManagementMode',
        :'name' => :'Name',
        :'oper_reason' => :'OperReason',
        :'oper_state' => :'OperState',
        :'part_number' => :'PartNumber',
        :'pid' => :'Pid',
        :'platform_type' => :'PlatformType',
        :'product_name' => :'ProductName',
        :'sku' => :'Sku',
        :'vid' => :'Vid',
        :'blades' => :'Blades',
        :'expander_modules' => :'ExpanderModules',
        :'fan_control' => :'FanControl',
        :'fanmodules' => :'Fanmodules',
        :'inventory_device_info' => :'InventoryDeviceInfo',
        :'ioms' => :'Ioms',
        :'locator_led' => :'LocatorLed',
        :'power_control_state' => :'PowerControlState',
        :'psu_control' => :'PsuControl',
        :'psus' => :'Psus',
        :'registered_device' => :'RegisteredDevice',
        :'sasexpanders' => :'Sasexpanders',
        :'siocs' => :'Siocs',
        :'storage_enclosures' => :'StorageEnclosures',
        :'virtual_drive_container' => :'VirtualDriveContainer'
      }
    end

    # Returns all the JSON keys this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attributes
      attribute_map.values.concat(superclass.acceptable_attributes)
    end

    # Returns the key-value map of all the JSON attributes this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attribute_map
      attribute_map.merge(superclass.acceptable_attribute_map)
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'alarm_summary' => :'ComputeAlarmSummary',
        :'chassis_id' => :'Integer',
        :'connection_path' => :'String',
        :'connection_status' => :'String',
        :'description' => :'String',
        :'fault_summary' => :'Integer',
        :'management_mode' => :'String',
        :'name' => :'String',
        :'oper_reason' => :'Array<String>',
        :'oper_state' => :'String',
        :'part_number' => :'String',
        :'pid' => :'String',
        :'platform_type' => :'String',
        :'product_name' => :'String',
        :'sku' => :'String',
        :'vid' => :'String',
        :'blades' => :'Array<ComputeBladeRelationship>',
        :'expander_modules' => :'Array<EquipmentExpanderModuleRelationship>',
        :'fan_control' => :'EquipmentFanControlRelationship',
        :'fanmodules' => :'Array<EquipmentFanModuleRelationship>',
        :'inventory_device_info' => :'InventoryDeviceInfoRelationship',
        :'ioms' => :'Array<EquipmentIoCardRelationship>',
        :'locator_led' => :'EquipmentLocatorLedRelationship',
        :'power_control_state' => :'PowerControlStateRelationship',
        :'psu_control' => :'EquipmentPsuControlRelationship',
        :'psus' => :'Array<EquipmentPsuRelationship>',
        :'registered_device' => :'AssetDeviceRegistrationRelationship',
        :'sasexpanders' => :'Array<StorageSasExpanderRelationship>',
        :'siocs' => :'Array<EquipmentSystemIoControllerRelationship>',
        :'storage_enclosures' => :'Array<StorageEnclosureRelationship>',
        :'virtual_drive_container' => :'Array<StorageVirtualDriveContainerRelationship>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'alarm_summary',
        :'oper_reason',
        :'blades',
        :'expander_modules',
        :'fanmodules',
        :'ioms',
        :'psus',
        :'sasexpanders',
        :'siocs',
        :'storage_enclosures',
        :'virtual_drive_container'
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'EquipmentBase',
      :'EquipmentChassisAllOf'
      ]
    end

    # discriminator's property name in OpenAPI v3
    def self.openapi_discriminator_name
      :'ClassId'
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::EquipmentChassis` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'equipment.Chassis'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'equipment.Chassis'
      end

      if attributes.key?(:'alarm_summary')
        self.alarm_summary = attributes[:'alarm_summary']
      end

      if attributes.key?(:'chassis_id')
        self.chassis_id = attributes[:'chassis_id']
      end

      if attributes.key?(:'connection_path')
        self.connection_path = attributes[:'connection_path']
      end

      if attributes.key?(:'connection_status')
        self.connection_status = attributes[:'connection_status']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'fault_summary')
        self.fault_summary = attributes[:'fault_summary']
      end

      if attributes.key?(:'management_mode')
        self.management_mode = attributes[:'management_mode']
      else
        self.management_mode = 'IntersightStandalone'
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'oper_reason')
        if (value = attributes[:'oper_reason']).is_a?(Array)
          self.oper_reason = value
        end
      end

      if attributes.key?(:'oper_state')
        self.oper_state = attributes[:'oper_state']
      end

      if attributes.key?(:'part_number')
        self.part_number = attributes[:'part_number']
      end

      if attributes.key?(:'pid')
        self.pid = attributes[:'pid']
      end

      if attributes.key?(:'platform_type')
        self.platform_type = attributes[:'platform_type']
      end

      if attributes.key?(:'product_name')
        self.product_name = attributes[:'product_name']
      end

      if attributes.key?(:'sku')
        self.sku = attributes[:'sku']
      end

      if attributes.key?(:'vid')
        self.vid = attributes[:'vid']
      end

      if attributes.key?(:'blades')
        if (value = attributes[:'blades']).is_a?(Array)
          self.blades = value
        end
      end

      if attributes.key?(:'expander_modules')
        if (value = attributes[:'expander_modules']).is_a?(Array)
          self.expander_modules = value
        end
      end

      if attributes.key?(:'fan_control')
        self.fan_control = attributes[:'fan_control']
      end

      if attributes.key?(:'fanmodules')
        if (value = attributes[:'fanmodules']).is_a?(Array)
          self.fanmodules = value
        end
      end

      if attributes.key?(:'inventory_device_info')
        self.inventory_device_info = attributes[:'inventory_device_info']
      end

      if attributes.key?(:'ioms')
        if (value = attributes[:'ioms']).is_a?(Array)
          self.ioms = value
        end
      end

      if attributes.key?(:'locator_led')
        self.locator_led = attributes[:'locator_led']
      end

      if attributes.key?(:'power_control_state')
        self.power_control_state = attributes[:'power_control_state']
      end

      if attributes.key?(:'psu_control')
        self.psu_control = attributes[:'psu_control']
      end

      if attributes.key?(:'psus')
        if (value = attributes[:'psus']).is_a?(Array)
          self.psus = value
        end
      end

      if attributes.key?(:'registered_device')
        self.registered_device = attributes[:'registered_device']
      end

      if attributes.key?(:'sasexpanders')
        if (value = attributes[:'sasexpanders']).is_a?(Array)
          self.sasexpanders = value
        end
      end

      if attributes.key?(:'siocs')
        if (value = attributes[:'siocs']).is_a?(Array)
          self.siocs = value
        end
      end

      if attributes.key?(:'storage_enclosures')
        if (value = attributes[:'storage_enclosures']).is_a?(Array)
          self.storage_enclosures = value
        end
      end

      if attributes.key?(:'virtual_drive_container')
        if (value = attributes[:'virtual_drive_container']).is_a?(Array)
          self.virtual_drive_container = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = super
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["equipment.Chassis"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["equipment.Chassis"])
      return false unless object_type_validator.valid?(@object_type)
      management_mode_validator = EnumAttributeValidator.new('String', ["IntersightStandalone", "UCSM", "Intersight"])
      return false unless management_mode_validator.valid?(@management_mode)
      true && super
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["equipment.Chassis"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["equipment.Chassis"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] management_mode Object to be assigned
    def management_mode=(management_mode)
      validator = EnumAttributeValidator.new('String', ["IntersightStandalone", "UCSM", "Intersight"])
      unless validator.valid?(management_mode)
        fail ArgumentError, "invalid value for \"management_mode\", must be one of #{validator.allowable_values}."
      end
      @management_mode = management_mode
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          alarm_summary == o.alarm_summary &&
          chassis_id == o.chassis_id &&
          connection_path == o.connection_path &&
          connection_status == o.connection_status &&
          description == o.description &&
          fault_summary == o.fault_summary &&
          management_mode == o.management_mode &&
          name == o.name &&
          oper_reason == o.oper_reason &&
          oper_state == o.oper_state &&
          part_number == o.part_number &&
          pid == o.pid &&
          platform_type == o.platform_type &&
          product_name == o.product_name &&
          sku == o.sku &&
          vid == o.vid &&
          blades == o.blades &&
          expander_modules == o.expander_modules &&
          fan_control == o.fan_control &&
          fanmodules == o.fanmodules &&
          inventory_device_info == o.inventory_device_info &&
          ioms == o.ioms &&
          locator_led == o.locator_led &&
          power_control_state == o.power_control_state &&
          psu_control == o.psu_control &&
          psus == o.psus &&
          registered_device == o.registered_device &&
          sasexpanders == o.sasexpanders &&
          siocs == o.siocs &&
          storage_enclosures == o.storage_enclosures &&
          virtual_drive_container == o.virtual_drive_container && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, alarm_summary, chassis_id, connection_path, connection_status, description, fault_summary, management_mode, name, oper_reason, oper_state, part_number, pid, platform_type, product_name, sku, vid, blades, expander_modules, fan_control, fanmodules, inventory_device_info, ioms, locator_led, power_control_state, psu_control, psus, registered_device, sasexpanders, siocs, storage_enclosures, virtual_drive_container].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      super(attributes)
      EquipmentChassis.openapi_types.each_pair do |key, type|
        if attributes[EquipmentChassis.attribute_map[key]].nil? && EquipmentChassis.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[EquipmentChassis.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[EquipmentChassis.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[EquipmentChassis.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[EquipmentChassis.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = IntersightClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = super
      EquipmentChassis.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = EquipmentChassis.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
