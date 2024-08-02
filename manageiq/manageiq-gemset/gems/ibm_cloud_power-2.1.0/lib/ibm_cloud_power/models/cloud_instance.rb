=begin
#Power Cloud API

#IBM Power Cloud API for Power Hardware / Infrastructure

The version of the OpenAPI document: 1.0.0
Contact: kylej@us.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module IbmCloudPower
  class CloudInstance
    # Cloud Instance Capabilities
    attr_accessor :capabilities

    # Cloud Instance ID
    attr_accessor :cloud_instance_id

    # Indicates if the cloud instance is enabled
    attr_accessor :enabled

    # Indicates if the cloud instance is initialized and ready for use
    attr_accessor :initialized

    attr_accessor :limits

    # Cloud Instance Name
    attr_accessor :name

    # The open stack ID that controls this cloud instance
    attr_accessor :openstack_id

    # PVM instances owned by the Cloud Instance
    attr_accessor :pvm_instances

    # The region the cloud instance lives
    attr_accessor :region

    # The tenant ID that owns this cloud instance
    attr_accessor :tenant_id

    attr_accessor :usage

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'capabilities' => :'capabilities',
        :'cloud_instance_id' => :'cloudInstanceID',
        :'enabled' => :'enabled',
        :'initialized' => :'initialized',
        :'limits' => :'limits',
        :'name' => :'name',
        :'openstack_id' => :'openstackID',
        :'pvm_instances' => :'pvmInstances',
        :'region' => :'region',
        :'tenant_id' => :'tenantID',
        :'usage' => :'usage'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'capabilities' => :'Array<String>',
        :'cloud_instance_id' => :'String',
        :'enabled' => :'Boolean',
        :'initialized' => :'Boolean',
        :'limits' => :'CloudInstanceUsageLimits',
        :'name' => :'String',
        :'openstack_id' => :'String',
        :'pvm_instances' => :'Array<PVMInstanceReference>',
        :'region' => :'String',
        :'tenant_id' => :'String',
        :'usage' => :'CloudInstanceUsageLimits'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `IbmCloudPower::CloudInstance` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `IbmCloudPower::CloudInstance`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'capabilities')
        if (value = attributes[:'capabilities']).is_a?(Array)
          self.capabilities = value
        end
      end

      if attributes.key?(:'cloud_instance_id')
        self.cloud_instance_id = attributes[:'cloud_instance_id']
      end

      if attributes.key?(:'enabled')
        self.enabled = attributes[:'enabled']
      end

      if attributes.key?(:'initialized')
        self.initialized = attributes[:'initialized']
      end

      if attributes.key?(:'limits')
        self.limits = attributes[:'limits']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'openstack_id')
        self.openstack_id = attributes[:'openstack_id']
      end

      if attributes.key?(:'pvm_instances')
        if (value = attributes[:'pvm_instances']).is_a?(Array)
          self.pvm_instances = value
        end
      end

      if attributes.key?(:'region')
        self.region = attributes[:'region']
      end

      if attributes.key?(:'tenant_id')
        self.tenant_id = attributes[:'tenant_id']
      end

      if attributes.key?(:'usage')
        self.usage = attributes[:'usage']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @cloud_instance_id.nil?
        invalid_properties.push('invalid value for "cloud_instance_id", cloud_instance_id cannot be nil.')
      end

      if @enabled.nil?
        invalid_properties.push('invalid value for "enabled", enabled cannot be nil.')
      end

      if @initialized.nil?
        invalid_properties.push('invalid value for "initialized", initialized cannot be nil.')
      end

      if @limits.nil?
        invalid_properties.push('invalid value for "limits", limits cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @openstack_id.nil?
        invalid_properties.push('invalid value for "openstack_id", openstack_id cannot be nil.')
      end

      if @pvm_instances.nil?
        invalid_properties.push('invalid value for "pvm_instances", pvm_instances cannot be nil.')
      end

      if @region.nil?
        invalid_properties.push('invalid value for "region", region cannot be nil.')
      end

      if @tenant_id.nil?
        invalid_properties.push('invalid value for "tenant_id", tenant_id cannot be nil.')
      end

      if @usage.nil?
        invalid_properties.push('invalid value for "usage", usage cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @cloud_instance_id.nil?
      return false if @enabled.nil?
      return false if @initialized.nil?
      return false if @limits.nil?
      return false if @name.nil?
      return false if @openstack_id.nil?
      return false if @pvm_instances.nil?
      return false if @region.nil?
      return false if @tenant_id.nil?
      return false if @usage.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          capabilities == o.capabilities &&
          cloud_instance_id == o.cloud_instance_id &&
          enabled == o.enabled &&
          initialized == o.initialized &&
          limits == o.limits &&
          name == o.name &&
          openstack_id == o.openstack_id &&
          pvm_instances == o.pvm_instances &&
          region == o.region &&
          tenant_id == o.tenant_id &&
          usage == o.usage
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [capabilities, cloud_instance_id, enabled, initialized, limits, name, openstack_id, pvm_instances, region, tenant_id, usage].hash
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
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
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
        klass = IbmCloudPower.const_get(type)
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
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
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
