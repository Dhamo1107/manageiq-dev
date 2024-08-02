# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SQL Statistics
  class Opsi::Models::SqlStatisticAggregation
    # **[Required]** Unique SQL_ID for a SQL Statement.
    #
    # @return [String]
    attr_accessor :sql_identifier

    # This attribute is required.
    # @return [OCI::Opsi::Models::DatabaseDetails]
    attr_accessor :database_details

    # **[Required]** SQL belongs to one or more categories based on the insights.
    #
    # @return [Array<String>]
    attr_accessor :category

    # @return [OCI::Opsi::Models::SqlStatistics]
    attr_accessor :statistics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_identifier': :'sqlIdentifier',
        'database_details': :'databaseDetails',
        'category': :'category',
        'statistics': :'statistics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_identifier': :'String',
        'database_details': :'OCI::Opsi::Models::DatabaseDetails',
        'category': :'Array<String>',
        'statistics': :'OCI::Opsi::Models::SqlStatistics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sql_identifier The value to assign to the {#sql_identifier} property
    # @option attributes [OCI::Opsi::Models::DatabaseDetails] :database_details The value to assign to the {#database_details} property
    # @option attributes [Array<String>] :category The value to assign to the {#category} property
    # @option attributes [OCI::Opsi::Models::SqlStatistics] :statistics The value to assign to the {#statistics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_identifier = attributes[:'sqlIdentifier'] if attributes[:'sqlIdentifier']

      raise 'You cannot provide both :sqlIdentifier and :sql_identifier' if attributes.key?(:'sqlIdentifier') && attributes.key?(:'sql_identifier')

      self.sql_identifier = attributes[:'sql_identifier'] if attributes[:'sql_identifier']

      self.database_details = attributes[:'databaseDetails'] if attributes[:'databaseDetails']

      raise 'You cannot provide both :databaseDetails and :database_details' if attributes.key?(:'databaseDetails') && attributes.key?(:'database_details')

      self.database_details = attributes[:'database_details'] if attributes[:'database_details']

      self.category = attributes[:'category'] if attributes[:'category']

      self.statistics = attributes[:'statistics'] if attributes[:'statistics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sql_identifier == other.sql_identifier &&
        database_details == other.database_details &&
        category == other.category &&
        statistics == other.statistics
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
      [sql_identifier, database_details, category, statistics].hash
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
