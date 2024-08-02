# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters for Extract processes.
  #
  class DatabaseMigration::Models::Extract
    PERFORMANCE_PROFILE_ENUM = [
      PERFORMANCE_PROFILE_LOW = 'LOW'.freeze,
      PERFORMANCE_PROFILE_MEDIUM = 'MEDIUM'.freeze,
      PERFORMANCE_PROFILE_HIGH = 'HIGH'.freeze,
      PERFORMANCE_PROFILE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Extract performance.
    #
    # @return [String]
    attr_reader :performance_profile

    # Length of time (in seconds) that a transaction can be open before Extract generates a warning message that the transaction is long-running.
    # If not specified, Extract will not generate a warning on long-running transactions.
    #
    # @return [Integer]
    attr_accessor :long_trans_duration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'performance_profile': :'performanceProfile',
        'long_trans_duration': :'longTransDuration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'performance_profile': :'String',
        'long_trans_duration': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :performance_profile The value to assign to the {#performance_profile} property
    # @option attributes [Integer] :long_trans_duration The value to assign to the {#long_trans_duration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.performance_profile = attributes[:'performanceProfile'] if attributes[:'performanceProfile']
      self.performance_profile = "MEDIUM" if performance_profile.nil? && !attributes.key?(:'performanceProfile') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :performanceProfile and :performance_profile' if attributes.key?(:'performanceProfile') && attributes.key?(:'performance_profile')

      self.performance_profile = attributes[:'performance_profile'] if attributes[:'performance_profile']
      self.performance_profile = "MEDIUM" if performance_profile.nil? && !attributes.key?(:'performanceProfile') && !attributes.key?(:'performance_profile') # rubocop:disable Style/StringLiterals

      self.long_trans_duration = attributes[:'longTransDuration'] if attributes[:'longTransDuration']

      raise 'You cannot provide both :longTransDuration and :long_trans_duration' if attributes.key?(:'longTransDuration') && attributes.key?(:'long_trans_duration')

      self.long_trans_duration = attributes[:'long_trans_duration'] if attributes[:'long_trans_duration']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] performance_profile Object to be assigned
    def performance_profile=(performance_profile)
      # rubocop:disable Style/ConditionalAssignment
      if performance_profile && !PERFORMANCE_PROFILE_ENUM.include?(performance_profile)
        OCI.logger.debug("Unknown value for 'performance_profile' [" + performance_profile + "]. Mapping to 'PERFORMANCE_PROFILE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @performance_profile = PERFORMANCE_PROFILE_UNKNOWN_ENUM_VALUE
      else
        @performance_profile = performance_profile
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        performance_profile == other.performance_profile &&
        long_trans_duration == other.long_trans_duration
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
      [performance_profile, long_trans_duration].hash
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
