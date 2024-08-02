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
  # Virtual Fibre Channel Interface.
  class VnicFcIf < MoBaseMo
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # Name of the virtual fibre channel interface.
    attr_accessor :name

    # The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
    attr_accessor :order

    # Enables retention of LUN ID associations in memory until they are manually cleared.
    attr_accessor :persistent_bindings

    attr_accessor :placement

    # The WWPN address must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx. Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF. To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
    attr_accessor :static_wwpn_address

    # VHBA Type configuration for SAN Connectivity Policy. This configuration is supported only on Cisco VIC 14XX series and higher series of adapters. * `fc-initiator` - The default value set for vHBA Type Configuration. Fc-initiator specifies vHBA as a consumer of storage. Enables SCSI commands to transfer data and status information between host and target storage systems. * `fc-nvme-initiator` - Fc-nvme-initiator specifies vHBA as a consumer of storage. Enables NVMe-based message commands to transfer data and status information between host and target storage systems. * `fc-nvme-target` - Fc-nvme-target specifies vHBA as a provider of storage volumes to initiators. Enables NVMe-based message commands to transfer data and status information between host and target storage systems. Currently tech-preview, only enabled with an asynchronous driver. * `fc-target` - Fc-target specifies vHBA as a provider of storage volumes to initiators. Enables SCSI commands to transfer data and status information between host and target storage systems. fc-target is enabled only with an asynchronous driver.
    attr_accessor :type

    # This should be the same as the channel number of the vfc created on switch in order to set up the data path. The property is applicable only for FI attached servers where a vfc is created on the switch for every vHBA.
    attr_accessor :vif_id

    # The WWPN address that is assigned to the vHBA based on the wwn pool that has been assigned to the SAN Connectivity Policy.
    attr_accessor :wwpn

    # Type of allocation selected to assign a WWPN address to the vhba. * `POOL` - The user selects a pool from which the mac/wwn address will be leased for the Virtual Interface. * `STATIC` - The user assigns a static mac/wwn address for the Virtual Interface.
    attr_accessor :wwpn_address_type

    attr_accessor :fc_adapter_policy

    attr_accessor :fc_network_policy

    attr_accessor :fc_qos_policy

    attr_accessor :profile

    attr_accessor :san_connectivity_policy

    attr_accessor :scp_vhba

    # An array of relationships to vnicFcIf resources.
    attr_accessor :sp_vhbas

    attr_accessor :wwpn_lease

    attr_accessor :wwpn_pool

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
        :'name' => :'Name',
        :'order' => :'Order',
        :'persistent_bindings' => :'PersistentBindings',
        :'placement' => :'Placement',
        :'static_wwpn_address' => :'StaticWwpnAddress',
        :'type' => :'Type',
        :'vif_id' => :'VifId',
        :'wwpn' => :'Wwpn',
        :'wwpn_address_type' => :'WwpnAddressType',
        :'fc_adapter_policy' => :'FcAdapterPolicy',
        :'fc_network_policy' => :'FcNetworkPolicy',
        :'fc_qos_policy' => :'FcQosPolicy',
        :'profile' => :'Profile',
        :'san_connectivity_policy' => :'SanConnectivityPolicy',
        :'scp_vhba' => :'ScpVhba',
        :'sp_vhbas' => :'SpVhbas',
        :'wwpn_lease' => :'WwpnLease',
        :'wwpn_pool' => :'WwpnPool'
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
        :'name' => :'String',
        :'order' => :'Integer',
        :'persistent_bindings' => :'Boolean',
        :'placement' => :'VnicPlacementSettings',
        :'static_wwpn_address' => :'String',
        :'type' => :'String',
        :'vif_id' => :'Integer',
        :'wwpn' => :'String',
        :'wwpn_address_type' => :'String',
        :'fc_adapter_policy' => :'VnicFcAdapterPolicyRelationship',
        :'fc_network_policy' => :'VnicFcNetworkPolicyRelationship',
        :'fc_qos_policy' => :'VnicFcQosPolicyRelationship',
        :'profile' => :'PolicyAbstractConfigProfileRelationship',
        :'san_connectivity_policy' => :'VnicSanConnectivityPolicyRelationship',
        :'scp_vhba' => :'VnicFcIfRelationship',
        :'sp_vhbas' => :'Array<VnicFcIfRelationship>',
        :'wwpn_lease' => :'FcpoolLeaseRelationship',
        :'wwpn_pool' => :'FcpoolPoolRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'placement',
        :'sp_vhbas',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'MoBaseMo',
      :'VnicFcIfAllOf'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::VnicFcIf` initialize method"
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
        self.class_id = 'vnic.FcIf'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'vnic.FcIf'
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'order')
        self.order = attributes[:'order']
      end

      if attributes.key?(:'persistent_bindings')
        self.persistent_bindings = attributes[:'persistent_bindings']
      end

      if attributes.key?(:'placement')
        self.placement = attributes[:'placement']
      end

      if attributes.key?(:'static_wwpn_address')
        self.static_wwpn_address = attributes[:'static_wwpn_address']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      else
        self.type = 'fc-initiator'
      end

      if attributes.key?(:'vif_id')
        self.vif_id = attributes[:'vif_id']
      end

      if attributes.key?(:'wwpn')
        self.wwpn = attributes[:'wwpn']
      end

      if attributes.key?(:'wwpn_address_type')
        self.wwpn_address_type = attributes[:'wwpn_address_type']
      else
        self.wwpn_address_type = 'POOL'
      end

      if attributes.key?(:'fc_adapter_policy')
        self.fc_adapter_policy = attributes[:'fc_adapter_policy']
      end

      if attributes.key?(:'fc_network_policy')
        self.fc_network_policy = attributes[:'fc_network_policy']
      end

      if attributes.key?(:'fc_qos_policy')
        self.fc_qos_policy = attributes[:'fc_qos_policy']
      end

      if attributes.key?(:'profile')
        self.profile = attributes[:'profile']
      end

      if attributes.key?(:'san_connectivity_policy')
        self.san_connectivity_policy = attributes[:'san_connectivity_policy']
      end

      if attributes.key?(:'scp_vhba')
        self.scp_vhba = attributes[:'scp_vhba']
      end

      if attributes.key?(:'sp_vhbas')
        if (value = attributes[:'sp_vhbas']).is_a?(Array)
          self.sp_vhbas = value
        end
      end

      if attributes.key?(:'wwpn_lease')
        self.wwpn_lease = attributes[:'wwpn_lease']
      end

      if attributes.key?(:'wwpn_pool')
        self.wwpn_pool = attributes[:'wwpn_pool']
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

      if !@name.nil? && @name.to_s.length > 31
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 31.')
      end

      pattern = Regexp.new(/^[a-zA-Z0-9\-\._:]+$/)
      if !@name.nil? && @name !~ pattern
        invalid_properties.push("invalid value for \"name\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      if !@static_wwpn_address.nil? && @static_wwpn_address !~ pattern
        invalid_properties.push("invalid value for \"static_wwpn_address\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      if !@wwpn.nil? && @wwpn !~ pattern
        invalid_properties.push("invalid value for \"wwpn\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["vnic.FcIf"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["vnic.FcIf"])
      return false unless object_type_validator.valid?(@object_type)
      return false if !@name.nil? && @name.to_s.length > 31
      return false if !@name.nil? && @name !~ Regexp.new(/^[a-zA-Z0-9\-\._:]+$/)
      return false if !@static_wwpn_address.nil? && @static_wwpn_address !~ Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      type_validator = EnumAttributeValidator.new('String', ["fc-initiator", "fc-nvme-initiator", "fc-nvme-target", "fc-target"])
      return false unless type_validator.valid?(@type)
      return false if !@wwpn.nil? && @wwpn !~ Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      wwpn_address_type_validator = EnumAttributeValidator.new('String', ["POOL", "STATIC"])
      return false unless wwpn_address_type_validator.valid?(@wwpn_address_type)
      true && super
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["vnic.FcIf"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["vnic.FcIf"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 31
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 31.'
      end

      pattern = Regexp.new(/^[a-zA-Z0-9\-\._:]+$/)
      if !name.nil? && name !~ pattern
        fail ArgumentError, "invalid value for \"name\", must conform to the pattern #{pattern}."
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] static_wwpn_address Value to be assigned
    def static_wwpn_address=(static_wwpn_address)
      pattern = Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      if !static_wwpn_address.nil? && static_wwpn_address !~ pattern
        fail ArgumentError, "invalid value for \"static_wwpn_address\", must conform to the pattern #{pattern}."
      end

      @static_wwpn_address = static_wwpn_address
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["fc-initiator", "fc-nvme-initiator", "fc-nvme-target", "fc-target"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method with validation
    # @param [Object] wwpn Value to be assigned
    def wwpn=(wwpn)
      pattern = Regexp.new(/^$|((^20|5[0-9a-fA-F]{1}):([0-9a-fA-F]{2}:){6}([0-9a-fA-F]{2}))/)
      if !wwpn.nil? && wwpn !~ pattern
        fail ArgumentError, "invalid value for \"wwpn\", must conform to the pattern #{pattern}."
      end

      @wwpn = wwpn
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] wwpn_address_type Object to be assigned
    def wwpn_address_type=(wwpn_address_type)
      validator = EnumAttributeValidator.new('String', ["POOL", "STATIC"])
      unless validator.valid?(wwpn_address_type)
        fail ArgumentError, "invalid value for \"wwpn_address_type\", must be one of #{validator.allowable_values}."
      end
      @wwpn_address_type = wwpn_address_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          name == o.name &&
          order == o.order &&
          persistent_bindings == o.persistent_bindings &&
          placement == o.placement &&
          static_wwpn_address == o.static_wwpn_address &&
          type == o.type &&
          vif_id == o.vif_id &&
          wwpn == o.wwpn &&
          wwpn_address_type == o.wwpn_address_type &&
          fc_adapter_policy == o.fc_adapter_policy &&
          fc_network_policy == o.fc_network_policy &&
          fc_qos_policy == o.fc_qos_policy &&
          profile == o.profile &&
          san_connectivity_policy == o.san_connectivity_policy &&
          scp_vhba == o.scp_vhba &&
          sp_vhbas == o.sp_vhbas &&
          wwpn_lease == o.wwpn_lease &&
          wwpn_pool == o.wwpn_pool && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, name, order, persistent_bindings, placement, static_wwpn_address, type, vif_id, wwpn, wwpn_address_type, fc_adapter_policy, fc_network_policy, fc_qos_policy, profile, san_connectivity_policy, scp_vhba, sp_vhbas, wwpn_lease, wwpn_pool].hash
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
      VnicFcIf.openapi_types.each_pair do |key, type|
        if attributes[VnicFcIf.attribute_map[key]].nil? && VnicFcIf.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[VnicFcIf.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[VnicFcIf.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[VnicFcIf.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[VnicFcIf.attribute_map[key]]))
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
      VnicFcIf.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = VnicFcIf.openapi_nullable.include?(attr)
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
