# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about a single backend server health check result reported by a network load balancer.
  #
  class NetworkLoadBalancer::Models::HealthCheckResult
    HEALTH_CHECK_STATUS_ENUM = [
      HEALTH_CHECK_STATUS_OK = 'OK'.freeze,
      HEALTH_CHECK_STATUS_INVALID_STATUS_CODE = 'INVALID_STATUS_CODE'.freeze,
      HEALTH_CHECK_STATUS_TIMED_OUT = 'TIMED_OUT'.freeze,
      HEALTH_CHECK_STATUS_HEALTH_PAYLOAD_MISMATCH = 'HEALTH_PAYLOAD_MISMATCH'.freeze,
      HEALTH_CHECK_STATUS_CONNECT_FAILED = 'CONNECT_FAILED'.freeze,
      HEALTH_CHECK_STATUS_UNKNOWN = 'UNKNOWN'.freeze,
      HEALTH_CHECK_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The date and time the data was retrieved, in the format defined by RFC3339.
    #
    # Example: `2020-05-01T18:28:11+00:00`
    #
    # @return [DateTime]
    attr_accessor :timestamp

    # **[Required]** The result of the most recent health check.
    #
    # @return [String]
    attr_reader :health_check_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'timestamp': :'timestamp',
        'health_check_status': :'healthCheckStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'timestamp': :'DateTime',
        'health_check_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [String] :health_check_status The value to assign to the {#health_check_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.health_check_status = attributes[:'healthCheckStatus'] if attributes[:'healthCheckStatus']

      raise 'You cannot provide both :healthCheckStatus and :health_check_status' if attributes.key?(:'healthCheckStatus') && attributes.key?(:'health_check_status')

      self.health_check_status = attributes[:'health_check_status'] if attributes[:'health_check_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] health_check_status Object to be assigned
    def health_check_status=(health_check_status)
      # rubocop:disable Style/ConditionalAssignment
      if health_check_status && !HEALTH_CHECK_STATUS_ENUM.include?(health_check_status)
        OCI.logger.debug("Unknown value for 'health_check_status' [" + health_check_status + "]. Mapping to 'HEALTH_CHECK_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @health_check_status = HEALTH_CHECK_STATUS_UNKNOWN_ENUM_VALUE
      else
        @health_check_status = health_check_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        timestamp == other.timestamp &&
        health_check_status == other.health_check_status
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
      [timestamp, health_check_status].hash
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
