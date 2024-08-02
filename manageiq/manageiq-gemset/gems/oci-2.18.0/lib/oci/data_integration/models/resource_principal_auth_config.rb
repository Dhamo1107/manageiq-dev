# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'auth_config'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Authentication configuration that uses OCI Resource Principal Auth for Generic REST invocation.
  class DataIntegration::Models::ResourcePrincipalAuthConfig < DataIntegration::Models::AuthConfig
    RESOURCE_PRINCIPAL_SOURCE_ENUM = [
      RESOURCE_PRINCIPAL_SOURCE_WORKSPACE = 'WORKSPACE'.freeze,
      RESOURCE_PRINCIPAL_SOURCE_APPLICATION = 'APPLICATION'.freeze,
      RESOURCE_PRINCIPAL_SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCI resource type that will supply the authentication token
    # @return [String]
    attr_reader :resource_principal_source

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'model_type': :'modelType',
        'resource_principal_source': :'resourcePrincipalSource'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'model_type': :'String',
        'resource_principal_source': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataIntegration::Models::AuthConfig#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataIntegration::Models::AuthConfig#model_version #model_version} proprety
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataIntegration::Models::AuthConfig#parent_ref #parent_ref} proprety
    # @option attributes [String] :resource_principal_source The value to assign to the {#resource_principal_source} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'OCI_RESOURCE_AUTH_CONFIG'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.resource_principal_source = attributes[:'resourcePrincipalSource'] if attributes[:'resourcePrincipalSource']

      raise 'You cannot provide both :resourcePrincipalSource and :resource_principal_source' if attributes.key?(:'resourcePrincipalSource') && attributes.key?(:'resource_principal_source')

      self.resource_principal_source = attributes[:'resource_principal_source'] if attributes[:'resource_principal_source']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_principal_source Object to be assigned
    def resource_principal_source=(resource_principal_source)
      # rubocop:disable Style/ConditionalAssignment
      if resource_principal_source && !RESOURCE_PRINCIPAL_SOURCE_ENUM.include?(resource_principal_source)
        OCI.logger.debug("Unknown value for 'resource_principal_source' [" + resource_principal_source + "]. Mapping to 'RESOURCE_PRINCIPAL_SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_principal_source = RESOURCE_PRINCIPAL_SOURCE_UNKNOWN_ENUM_VALUE
      else
        @resource_principal_source = resource_principal_source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        model_type == other.model_type &&
        resource_principal_source == other.resource_principal_source
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
      [key, model_version, parent_ref, model_type, resource_principal_source].hash
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
