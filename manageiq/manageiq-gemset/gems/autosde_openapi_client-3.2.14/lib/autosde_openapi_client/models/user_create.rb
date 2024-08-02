=begin
#Site Manager API

#Site Manager API

The version of the OpenAPI document: 1.0.0
Contact: autosde@il.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0

=end

require 'date'
require 'time'

module AutosdeOpenapiClient
  # TODO add description
  class UserCreate
    # date_joined
    attr_accessor :date_joined

    # email
    attr_accessor :email

    # first_name
    attr_accessor :first_name

    # is_active
    attr_accessor :is_active

    # is_staff
    attr_accessor :is_staff

    # is_superuser
    attr_accessor :is_superuser

    # last_login
    attr_accessor :last_login

    # last_name
    attr_accessor :last_name

    # password
    attr_accessor :password

    # username
    attr_accessor :username

    # uuid
    attr_accessor :uuid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'date_joined' => :'date_joined',
        :'email' => :'email',
        :'first_name' => :'first_name',
        :'is_active' => :'is_active',
        :'is_staff' => :'is_staff',
        :'is_superuser' => :'is_superuser',
        :'last_login' => :'last_login',
        :'last_name' => :'last_name',
        :'password' => :'password',
        :'username' => :'username',
        :'uuid' => :'uuid'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'date_joined' => :'Time',
        :'email' => :'String',
        :'first_name' => :'String',
        :'is_active' => :'Boolean',
        :'is_staff' => :'Boolean',
        :'is_superuser' => :'Boolean',
        :'last_login' => :'Time',
        :'last_name' => :'String',
        :'password' => :'String',
        :'username' => :'String',
        :'uuid' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `AutosdeOpenapiClient::UserCreate` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `AutosdeOpenapiClient::UserCreate`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'date_joined')
        self.date_joined = attributes[:'date_joined']
      end

      if attributes.key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.key?(:'is_active')
        self.is_active = attributes[:'is_active']
      end

      if attributes.key?(:'is_staff')
        self.is_staff = attributes[:'is_staff']
      end

      if attributes.key?(:'is_superuser')
        self.is_superuser = attributes[:'is_superuser']
      end

      if attributes.key?(:'last_login')
        self.last_login = attributes[:'last_login']
      end

      if attributes.key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@email.nil? && @email.to_s.length > 254
        invalid_properties.push('invalid value for "email", the character length must be smaller than or equal to 254.')
      end

      if !@first_name.nil? && @first_name.to_s.length > 150
        invalid_properties.push('invalid value for "first_name", the character length must be smaller than or equal to 150.')
      end

      if !@last_name.nil? && @last_name.to_s.length > 150
        invalid_properties.push('invalid value for "last_name", the character length must be smaller than or equal to 150.')
      end

      if !@password.nil? && @password.to_s.length > 128
        invalid_properties.push('invalid value for "password", the character length must be smaller than or equal to 128.')
      end

      if !@username.nil? && @username.to_s.length > 150
        invalid_properties.push('invalid value for "username", the character length must be smaller than or equal to 150.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@email.nil? && @email.to_s.length > 254
      return false if !@first_name.nil? && @first_name.to_s.length > 150
      return false if !@last_name.nil? && @last_name.to_s.length > 150
      return false if !@password.nil? && @password.to_s.length > 128
      return false if !@username.nil? && @username.to_s.length > 150
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] email Value to be assigned
    def email=(email)
      if !email.nil? && email.to_s.length > 254
        fail ArgumentError, 'invalid value for "email", the character length must be smaller than or equal to 254.'
      end

      @email = email
    end

    # Custom attribute writer method with validation
    # @param [Object] first_name Value to be assigned
    def first_name=(first_name)
      if !first_name.nil? && first_name.to_s.length > 150
        fail ArgumentError, 'invalid value for "first_name", the character length must be smaller than or equal to 150.'
      end

      @first_name = first_name
    end

    # Custom attribute writer method with validation
    # @param [Object] last_name Value to be assigned
    def last_name=(last_name)
      if !last_name.nil? && last_name.to_s.length > 150
        fail ArgumentError, 'invalid value for "last_name", the character length must be smaller than or equal to 150.'
      end

      @last_name = last_name
    end

    # Custom attribute writer method with validation
    # @param [Object] password Value to be assigned
    def password=(password)
      if !password.nil? && password.to_s.length > 128
        fail ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 128.'
      end

      @password = password
    end

    # Custom attribute writer method with validation
    # @param [Object] username Value to be assigned
    def username=(username)
      if !username.nil? && username.to_s.length > 150
        fail ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 150.'
      end

      @username = username
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          date_joined == o.date_joined &&
          email == o.email &&
          first_name == o.first_name &&
          is_active == o.is_active &&
          is_staff == o.is_staff &&
          is_superuser == o.is_superuser &&
          last_login == o.last_login &&
          last_name == o.last_name &&
          password == o.password &&
          username == o.username &&
          uuid == o.uuid
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [date_joined, email, first_name, is_active, is_staff, is_superuser, last_login, last_name, password, username, uuid].hash
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
        klass = AutosdeOpenapiClient.const_get(type)
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
