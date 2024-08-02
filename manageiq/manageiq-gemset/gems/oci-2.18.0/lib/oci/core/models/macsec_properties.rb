# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used for MACsec (if capable).
  class Core::Models::MacsecProperties
    STATE_ENUM = [
      STATE_ENABLED = 'ENABLED'.freeze,
      STATE_DISABLED = 'DISABLED'.freeze,
      STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENCRYPTION_CIPHER_ENUM = [
      ENCRYPTION_CIPHER_AES128_GCM = 'AES128_GCM'.freeze,
      ENCRYPTION_CIPHER_AES128_GCM_XPN = 'AES128_GCM_XPN'.freeze,
      ENCRYPTION_CIPHER_AES256_GCM = 'AES256_GCM'.freeze,
      ENCRYPTION_CIPHER_AES256_GCM_XPN = 'AES256_GCM_XPN'.freeze,
      ENCRYPTION_CIPHER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Indicates whether or not MACsec is enabled.
    # @return [String]
    attr_reader :state

    # @return [OCI::Core::Models::MacsecKey]
    attr_accessor :primary_key

    # Type of encryption cipher suite to use for the MACsec connection.
    # @return [String]
    attr_reader :encryption_cipher

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'state': :'state',
        'primary_key': :'primaryKey',
        'encryption_cipher': :'encryptionCipher'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'state': :'String',
        'primary_key': :'OCI::Core::Models::MacsecKey',
        'encryption_cipher': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :state The value to assign to the {#state} property
    # @option attributes [OCI::Core::Models::MacsecKey] :primary_key The value to assign to the {#primary_key} property
    # @option attributes [String] :encryption_cipher The value to assign to the {#encryption_cipher} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.state = attributes[:'state'] if attributes[:'state']

      self.primary_key = attributes[:'primaryKey'] if attributes[:'primaryKey']

      raise 'You cannot provide both :primaryKey and :primary_key' if attributes.key?(:'primaryKey') && attributes.key?(:'primary_key')

      self.primary_key = attributes[:'primary_key'] if attributes[:'primary_key']

      self.encryption_cipher = attributes[:'encryptionCipher'] if attributes[:'encryptionCipher']

      raise 'You cannot provide both :encryptionCipher and :encryption_cipher' if attributes.key?(:'encryptionCipher') && attributes.key?(:'encryption_cipher')

      self.encryption_cipher = attributes[:'encryption_cipher'] if attributes[:'encryption_cipher']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      # rubocop:disable Style/ConditionalAssignment
      if state && !STATE_ENUM.include?(state)
        OCI.logger.debug("Unknown value for 'state' [" + state + "]. Mapping to 'STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @state = STATE_UNKNOWN_ENUM_VALUE
      else
        @state = state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] encryption_cipher Object to be assigned
    def encryption_cipher=(encryption_cipher)
      # rubocop:disable Style/ConditionalAssignment
      if encryption_cipher && !ENCRYPTION_CIPHER_ENUM.include?(encryption_cipher)
        OCI.logger.debug("Unknown value for 'encryption_cipher' [" + encryption_cipher + "]. Mapping to 'ENCRYPTION_CIPHER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @encryption_cipher = ENCRYPTION_CIPHER_UNKNOWN_ENUM_VALUE
      else
        @encryption_cipher = encryption_cipher
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        state == other.state &&
        primary_key == other.primary_key &&
        encryption_cipher == other.encryption_cipher
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [state, primary_key, encryption_cipher].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

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
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
