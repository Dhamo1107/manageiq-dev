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
  # Definition of the list of properties defined in 'storage.NetAppAggregate', excluding properties defined in parent classes.
  class StorageNetAppAggregateAllOf
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # Storage disk type for NetApp aggregate. * `HDD` - Hard Disk Drive disk type. * `Hybrid` - Solid State Hard Disk Drive. * `Hybrid (Flash Pool)` - SSHD in a flash pool disk type. * `SSD` - Solid State Disk disk type. * `SSD (FabricPool)` - SSD in a flash pool disk type. * `VMDisk (SDS)` - Storage disk with Hard disk drive. * `VMDisk (FabricPool)` - Storage disk with Non-volatile random-access memory drives. * `LUN (FlexArray)` - LUN (FlexArray) disk type. * `Not Mapped` - Storage disk is not mapped.
    attr_accessor :aggregate_type

    attr_accessor :avg_performance_metrics

    # Unique identifier of NetApp Aggregate across data center.
    attr_accessor :key

    # Size of the RAID group represented by number of disks in the group.
    attr_accessor :raid_size

    # The RAID configuration type. * `Unknown` - Default unknown RAID type. * `RAID0` - RAID0 splits (\"stripes\") data evenly across two or more disks, without parity information. * `RAID1` - RAID1 requires a minimum of two disks to work, and provides data redundancy and failover. * `RAID4` - RAID4 stripes block level data and dedicates a disk to parity. * `RAID5` - RAID5  distributes striping and parity at a block level. * `RAID6` - RAID6 level operates like RAID5 with distributed parity and striping. * `RAID10` - RAID10 requires a minimum of four disks in the array. It stripes across disks for higher performance, and mirrors for redundancy. * `RAIDDP` - RAIDDP uses up to two spare disks to replace and reconstruct the data from up to two simultaneously failed disks within the RAID group. * `RAIDTEC` - With RAIDTEC protection, use up to three spare disks to replace and reconstruct the data from up to three simultaneously failed disks within the RAID group.
    attr_accessor :raid_type

    # Current state of the NetApp aggregate. * `Unknown` - Specifies that the aggregate is discovered, but the aggregate information is not yet retrieved by the Unified Manager server. * `Online` - Aggregate is ready and available. * `Onlining` - The state is transitioning online. * `Offline` - Aggregate is unavailable. * `Offlining` - The state is transitioning offline. * `Relocating` - The aggregate is being relocated. * `Restricted` - Limited operations (e.g., parity reconstruction) are allowed, but data access is not allowed. * `Failed` - The aggregate cannot be brought online. * `Inconsistent` - The aggregate has been marked corrupted; contact technical support. * `Unmounted` - The aggregate is not mounted.
    attr_accessor :state

    # Uuid of  NetApp Aggregate.
    attr_accessor :uuid

    attr_accessor :array_controller

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
        :'aggregate_type' => :'AggregateType',
        :'avg_performance_metrics' => :'AvgPerformanceMetrics',
        :'key' => :'Key',
        :'raid_size' => :'RaidSize',
        :'raid_type' => :'RaidType',
        :'state' => :'State',
        :'uuid' => :'Uuid',
        :'array_controller' => :'ArrayController'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Returns the key-value map of all the JSON attributes this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'aggregate_type' => :'String',
        :'avg_performance_metrics' => :'StorageNetAppPerformanceMetricsAverage',
        :'key' => :'String',
        :'raid_size' => :'Integer',
        :'raid_type' => :'String',
        :'state' => :'String',
        :'uuid' => :'String',
        :'array_controller' => :'StorageNetAppNodeRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::StorageNetAppAggregateAllOf` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'storage.NetAppAggregate'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'storage.NetAppAggregate'
      end

      if attributes.key?(:'aggregate_type')
        self.aggregate_type = attributes[:'aggregate_type']
      else
        self.aggregate_type = 'HDD'
      end

      if attributes.key?(:'avg_performance_metrics')
        self.avg_performance_metrics = attributes[:'avg_performance_metrics']
      end

      if attributes.key?(:'key')
        self.key = attributes[:'key']
      end

      if attributes.key?(:'raid_size')
        self.raid_size = attributes[:'raid_size']
      end

      if attributes.key?(:'raid_type')
        self.raid_type = attributes[:'raid_type']
      else
        self.raid_type = 'Unknown'
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      else
        self.state = 'Unknown'
      end

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end

      if attributes.key?(:'array_controller')
        self.array_controller = attributes[:'array_controller']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      pattern = Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if !@uuid.nil? && @uuid !~ pattern
        invalid_properties.push("invalid value for \"uuid\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["storage.NetAppAggregate"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["storage.NetAppAggregate"])
      return false unless object_type_validator.valid?(@object_type)
      aggregate_type_validator = EnumAttributeValidator.new('String', ["HDD", "Hybrid", "Hybrid (Flash Pool)", "SSD", "SSD (FabricPool)", "VMDisk (SDS)", "VMDisk (FabricPool)", "LUN (FlexArray)", "Not Mapped"])
      return false unless aggregate_type_validator.valid?(@aggregate_type)
      raid_type_validator = EnumAttributeValidator.new('String', ["Unknown", "RAID0", "RAID1", "RAID4", "RAID5", "RAID6", "RAID10", "RAIDDP", "RAIDTEC"])
      return false unless raid_type_validator.valid?(@raid_type)
      state_validator = EnumAttributeValidator.new('String', ["Unknown", "Online", "Onlining", "Offline", "Offlining", "Relocating", "Restricted", "Failed", "Inconsistent", "Unmounted"])
      return false unless state_validator.valid?(@state)
      return false if !@uuid.nil? && @uuid !~ Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["storage.NetAppAggregate"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["storage.NetAppAggregate"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] aggregate_type Object to be assigned
    def aggregate_type=(aggregate_type)
      validator = EnumAttributeValidator.new('String', ["HDD", "Hybrid", "Hybrid (Flash Pool)", "SSD", "SSD (FabricPool)", "VMDisk (SDS)", "VMDisk (FabricPool)", "LUN (FlexArray)", "Not Mapped"])
      unless validator.valid?(aggregate_type)
        fail ArgumentError, "invalid value for \"aggregate_type\", must be one of #{validator.allowable_values}."
      end
      @aggregate_type = aggregate_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] raid_type Object to be assigned
    def raid_type=(raid_type)
      validator = EnumAttributeValidator.new('String', ["Unknown", "RAID0", "RAID1", "RAID4", "RAID5", "RAID6", "RAID10", "RAIDDP", "RAIDTEC"])
      unless validator.valid?(raid_type)
        fail ArgumentError, "invalid value for \"raid_type\", must be one of #{validator.allowable_values}."
      end
      @raid_type = raid_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["Unknown", "Online", "Onlining", "Offline", "Offlining", "Relocating", "Restricted", "Failed", "Inconsistent", "Unmounted"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for \"state\", must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method with validation
    # @param [Object] uuid Value to be assigned
    def uuid=(uuid)
      pattern = Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if !uuid.nil? && uuid !~ pattern
        fail ArgumentError, "invalid value for \"uuid\", must conform to the pattern #{pattern}."
      end

      @uuid = uuid
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          aggregate_type == o.aggregate_type &&
          avg_performance_metrics == o.avg_performance_metrics &&
          key == o.key &&
          raid_size == o.raid_size &&
          raid_type == o.raid_type &&
          state == o.state &&
          uuid == o.uuid &&
          array_controller == o.array_controller
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, aggregate_type, avg_performance_metrics, key, raid_size, raid_type, state, uuid, array_controller].hash
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
      StorageNetAppAggregateAllOf.openapi_types.each_pair do |key, type|
        if attributes[StorageNetAppAggregateAllOf.attribute_map[key]].nil? && StorageNetAppAggregateAllOf.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[StorageNetAppAggregateAllOf.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[StorageNetAppAggregateAllOf.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[StorageNetAppAggregateAllOf.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[StorageNetAppAggregateAllOf.attribute_map[key]]))
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
      hash = {}
      StorageNetAppAggregateAllOf.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = StorageNetAppAggregateAllOf.openapi_nullable.include?(attr)
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
