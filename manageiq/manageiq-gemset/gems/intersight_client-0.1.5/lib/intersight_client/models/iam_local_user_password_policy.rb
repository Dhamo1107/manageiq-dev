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
  # Configuration for LocalUserPasswordPolicy.
  class IamLocalUserPasswordPolicy < MoBaseMo
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # Minimum number of characters different from previous password.
    attr_accessor :min_char_difference

    # Minimum Days allowed between password change.
    attr_accessor :min_days_between_password_change

    # Minimum length of password.
    attr_accessor :min_length_password

    # Minimum number of required lower case characters.
    attr_accessor :min_lower_case

    # Minimum number of required numeric characters.
    attr_accessor :min_numeric

    # Minimum number of required special characters.
    attr_accessor :min_special_char

    # Minimum number of required upper case characters.
    attr_accessor :min_upper_case

    # Number of previous passwords disallowed.
    attr_accessor :num_previous_passwords_disallowed

    attr_accessor :account

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
        :'min_char_difference' => :'MinCharDifference',
        :'min_days_between_password_change' => :'MinDaysBetweenPasswordChange',
        :'min_length_password' => :'MinLengthPassword',
        :'min_lower_case' => :'MinLowerCase',
        :'min_numeric' => :'MinNumeric',
        :'min_special_char' => :'MinSpecialChar',
        :'min_upper_case' => :'MinUpperCase',
        :'num_previous_passwords_disallowed' => :'NumPreviousPasswordsDisallowed',
        :'account' => :'Account'
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
        :'min_char_difference' => :'Integer',
        :'min_days_between_password_change' => :'Integer',
        :'min_length_password' => :'Integer',
        :'min_lower_case' => :'Integer',
        :'min_numeric' => :'Integer',
        :'min_special_char' => :'Integer',
        :'min_upper_case' => :'Integer',
        :'num_previous_passwords_disallowed' => :'Integer',
        :'account' => :'IamAccountRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'IamLocalUserPasswordPolicyAllOf',
      :'MoBaseMo'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::IamLocalUserPasswordPolicy` initialize method"
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
        self.class_id = 'iam.LocalUserPasswordPolicy'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'iam.LocalUserPasswordPolicy'
      end

      if attributes.key?(:'min_char_difference')
        self.min_char_difference = attributes[:'min_char_difference']
      else
        self.min_char_difference = 0
      end

      if attributes.key?(:'min_days_between_password_change')
        self.min_days_between_password_change = attributes[:'min_days_between_password_change']
      else
        self.min_days_between_password_change = 0
      end

      if attributes.key?(:'min_length_password')
        self.min_length_password = attributes[:'min_length_password']
      else
        self.min_length_password = 8
      end

      if attributes.key?(:'min_lower_case')
        self.min_lower_case = attributes[:'min_lower_case']
      else
        self.min_lower_case = 1
      end

      if attributes.key?(:'min_numeric')
        self.min_numeric = attributes[:'min_numeric']
      else
        self.min_numeric = 1
      end

      if attributes.key?(:'min_special_char')
        self.min_special_char = attributes[:'min_special_char']
      else
        self.min_special_char = 0
      end

      if attributes.key?(:'min_upper_case')
        self.min_upper_case = attributes[:'min_upper_case']
      else
        self.min_upper_case = 1
      end

      if attributes.key?(:'num_previous_passwords_disallowed')
        self.num_previous_passwords_disallowed = attributes[:'num_previous_passwords_disallowed']
      else
        self.num_previous_passwords_disallowed = 0
      end

      if attributes.key?(:'account')
        self.account = attributes[:'account']
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

      if !@min_char_difference.nil? && @min_char_difference > 15
        invalid_properties.push('invalid value for "min_char_difference", must be smaller than or equal to 15.')
      end

      if !@min_char_difference.nil? && @min_char_difference < 0
        invalid_properties.push('invalid value for "min_char_difference", must be greater than or equal to 0.')
      end

      if !@min_days_between_password_change.nil? && @min_days_between_password_change > 7
        invalid_properties.push('invalid value for "min_days_between_password_change", must be smaller than or equal to 7.')
      end

      if !@min_days_between_password_change.nil? && @min_days_between_password_change < 0
        invalid_properties.push('invalid value for "min_days_between_password_change", must be greater than or equal to 0.')
      end

      if !@min_length_password.nil? && @min_length_password > 127
        invalid_properties.push('invalid value for "min_length_password", must be smaller than or equal to 127.')
      end

      if !@min_length_password.nil? && @min_length_password < 8
        invalid_properties.push('invalid value for "min_length_password", must be greater than or equal to 8.')
      end

      if !@min_lower_case.nil? && @min_lower_case > 64
        invalid_properties.push('invalid value for "min_lower_case", must be smaller than or equal to 64.')
      end

      if !@min_lower_case.nil? && @min_lower_case < 1
        invalid_properties.push('invalid value for "min_lower_case", must be greater than or equal to 1.')
      end

      if !@min_numeric.nil? && @min_numeric > 64
        invalid_properties.push('invalid value for "min_numeric", must be smaller than or equal to 64.')
      end

      if !@min_numeric.nil? && @min_numeric < 1
        invalid_properties.push('invalid value for "min_numeric", must be greater than or equal to 1.')
      end

      if !@min_special_char.nil? && @min_special_char > 64
        invalid_properties.push('invalid value for "min_special_char", must be smaller than or equal to 64.')
      end

      if !@min_special_char.nil? && @min_special_char < 0
        invalid_properties.push('invalid value for "min_special_char", must be greater than or equal to 0.')
      end

      if !@min_upper_case.nil? && @min_upper_case > 64
        invalid_properties.push('invalid value for "min_upper_case", must be smaller than or equal to 64.')
      end

      if !@min_upper_case.nil? && @min_upper_case < 1
        invalid_properties.push('invalid value for "min_upper_case", must be greater than or equal to 1.')
      end

      if !@num_previous_passwords_disallowed.nil? && @num_previous_passwords_disallowed > 10
        invalid_properties.push('invalid value for "num_previous_passwords_disallowed", must be smaller than or equal to 10.')
      end

      if !@num_previous_passwords_disallowed.nil? && @num_previous_passwords_disallowed < 0
        invalid_properties.push('invalid value for "num_previous_passwords_disallowed", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["iam.LocalUserPasswordPolicy"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["iam.LocalUserPasswordPolicy"])
      return false unless object_type_validator.valid?(@object_type)
      return false if !@min_char_difference.nil? && @min_char_difference > 15
      return false if !@min_char_difference.nil? && @min_char_difference < 0
      return false if !@min_days_between_password_change.nil? && @min_days_between_password_change > 7
      return false if !@min_days_between_password_change.nil? && @min_days_between_password_change < 0
      return false if !@min_length_password.nil? && @min_length_password > 127
      return false if !@min_length_password.nil? && @min_length_password < 8
      return false if !@min_lower_case.nil? && @min_lower_case > 64
      return false if !@min_lower_case.nil? && @min_lower_case < 1
      return false if !@min_numeric.nil? && @min_numeric > 64
      return false if !@min_numeric.nil? && @min_numeric < 1
      return false if !@min_special_char.nil? && @min_special_char > 64
      return false if !@min_special_char.nil? && @min_special_char < 0
      return false if !@min_upper_case.nil? && @min_upper_case > 64
      return false if !@min_upper_case.nil? && @min_upper_case < 1
      return false if !@num_previous_passwords_disallowed.nil? && @num_previous_passwords_disallowed > 10
      return false if !@num_previous_passwords_disallowed.nil? && @num_previous_passwords_disallowed < 0
      true && super
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["iam.LocalUserPasswordPolicy"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["iam.LocalUserPasswordPolicy"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method with validation
    # @param [Object] min_char_difference Value to be assigned
    def min_char_difference=(min_char_difference)
      if !min_char_difference.nil? && min_char_difference > 15
        fail ArgumentError, 'invalid value for "min_char_difference", must be smaller than or equal to 15.'
      end

      if !min_char_difference.nil? && min_char_difference < 0
        fail ArgumentError, 'invalid value for "min_char_difference", must be greater than or equal to 0.'
      end

      @min_char_difference = min_char_difference
    end

    # Custom attribute writer method with validation
    # @param [Object] min_days_between_password_change Value to be assigned
    def min_days_between_password_change=(min_days_between_password_change)
      if !min_days_between_password_change.nil? && min_days_between_password_change > 7
        fail ArgumentError, 'invalid value for "min_days_between_password_change", must be smaller than or equal to 7.'
      end

      if !min_days_between_password_change.nil? && min_days_between_password_change < 0
        fail ArgumentError, 'invalid value for "min_days_between_password_change", must be greater than or equal to 0.'
      end

      @min_days_between_password_change = min_days_between_password_change
    end

    # Custom attribute writer method with validation
    # @param [Object] min_length_password Value to be assigned
    def min_length_password=(min_length_password)
      if !min_length_password.nil? && min_length_password > 127
        fail ArgumentError, 'invalid value for "min_length_password", must be smaller than or equal to 127.'
      end

      if !min_length_password.nil? && min_length_password < 8
        fail ArgumentError, 'invalid value for "min_length_password", must be greater than or equal to 8.'
      end

      @min_length_password = min_length_password
    end

    # Custom attribute writer method with validation
    # @param [Object] min_lower_case Value to be assigned
    def min_lower_case=(min_lower_case)
      if !min_lower_case.nil? && min_lower_case > 64
        fail ArgumentError, 'invalid value for "min_lower_case", must be smaller than or equal to 64.'
      end

      if !min_lower_case.nil? && min_lower_case < 1
        fail ArgumentError, 'invalid value for "min_lower_case", must be greater than or equal to 1.'
      end

      @min_lower_case = min_lower_case
    end

    # Custom attribute writer method with validation
    # @param [Object] min_numeric Value to be assigned
    def min_numeric=(min_numeric)
      if !min_numeric.nil? && min_numeric > 64
        fail ArgumentError, 'invalid value for "min_numeric", must be smaller than or equal to 64.'
      end

      if !min_numeric.nil? && min_numeric < 1
        fail ArgumentError, 'invalid value for "min_numeric", must be greater than or equal to 1.'
      end

      @min_numeric = min_numeric
    end

    # Custom attribute writer method with validation
    # @param [Object] min_special_char Value to be assigned
    def min_special_char=(min_special_char)
      if !min_special_char.nil? && min_special_char > 64
        fail ArgumentError, 'invalid value for "min_special_char", must be smaller than or equal to 64.'
      end

      if !min_special_char.nil? && min_special_char < 0
        fail ArgumentError, 'invalid value for "min_special_char", must be greater than or equal to 0.'
      end

      @min_special_char = min_special_char
    end

    # Custom attribute writer method with validation
    # @param [Object] min_upper_case Value to be assigned
    def min_upper_case=(min_upper_case)
      if !min_upper_case.nil? && min_upper_case > 64
        fail ArgumentError, 'invalid value for "min_upper_case", must be smaller than or equal to 64.'
      end

      if !min_upper_case.nil? && min_upper_case < 1
        fail ArgumentError, 'invalid value for "min_upper_case", must be greater than or equal to 1.'
      end

      @min_upper_case = min_upper_case
    end

    # Custom attribute writer method with validation
    # @param [Object] num_previous_passwords_disallowed Value to be assigned
    def num_previous_passwords_disallowed=(num_previous_passwords_disallowed)
      if !num_previous_passwords_disallowed.nil? && num_previous_passwords_disallowed > 10
        fail ArgumentError, 'invalid value for "num_previous_passwords_disallowed", must be smaller than or equal to 10.'
      end

      if !num_previous_passwords_disallowed.nil? && num_previous_passwords_disallowed < 0
        fail ArgumentError, 'invalid value for "num_previous_passwords_disallowed", must be greater than or equal to 0.'
      end

      @num_previous_passwords_disallowed = num_previous_passwords_disallowed
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          min_char_difference == o.min_char_difference &&
          min_days_between_password_change == o.min_days_between_password_change &&
          min_length_password == o.min_length_password &&
          min_lower_case == o.min_lower_case &&
          min_numeric == o.min_numeric &&
          min_special_char == o.min_special_char &&
          min_upper_case == o.min_upper_case &&
          num_previous_passwords_disallowed == o.num_previous_passwords_disallowed &&
          account == o.account && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, min_char_difference, min_days_between_password_change, min_length_password, min_lower_case, min_numeric, min_special_char, min_upper_case, num_previous_passwords_disallowed, account].hash
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
      IamLocalUserPasswordPolicy.openapi_types.each_pair do |key, type|
        if attributes[IamLocalUserPasswordPolicy.attribute_map[key]].nil? && IamLocalUserPasswordPolicy.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[IamLocalUserPasswordPolicy.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[IamLocalUserPasswordPolicy.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[IamLocalUserPasswordPolicy.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[IamLocalUserPasswordPolicy.attribute_map[key]]))
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
      IamLocalUserPasswordPolicy.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = IamLocalUserPasswordPolicy.openapi_nullable.include?(attr)
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
