# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_sensitive_type_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create a new sensitive type with regular expressions.
  class DataSafe::Models::CreateSensitiveTypePatternDetails < DataSafe::Models::CreateSensitiveTypeDetails
    # A regular expression to be used by data discovery for matching column names.
    # @return [String]
    attr_accessor :name_pattern

    # A regular expression to be used by data discovery for matching column comments.
    # @return [String]
    attr_accessor :comment_pattern

    # A regular expression to be used by data discovery for matching column data values.
    # @return [String]
    attr_accessor :data_pattern

    # The search type indicating how the column name, comment and data patterns should be used by data discovery.
    # [Learn more](https://docs.oracle.com/en/cloud/paas/data-safe/udscs/sensitive-types.html#GUID-1D1AD98E-B93F-4FF2-80AE-CB7D8A14F6CC).
    #
    # @return [String]
    attr_accessor :search_type

    # The OCID of the library masking format that should be used to mask the sensitive columns associated with the sensitive type.
    # @return [String]
    attr_accessor :default_masking_format_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_type': :'entityType',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'short_name': :'shortName',
        'description': :'description',
        'parent_category_id': :'parentCategoryId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'name_pattern': :'namePattern',
        'comment_pattern': :'commentPattern',
        'data_pattern': :'dataPattern',
        'search_type': :'searchType',
        'default_masking_format_id': :'defaultMaskingFormatId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_type': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'short_name': :'String',
        'description': :'String',
        'parent_category_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'name_pattern': :'String',
        'comment_pattern': :'String',
        'data_pattern': :'String',
        'search_type': :'String',
        'default_masking_format_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#display_name #display_name} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#compartment_id #compartment_id} proprety
    # @option attributes [String] :short_name The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#short_name #short_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#description #description} proprety
    # @option attributes [String] :parent_category_id The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#parent_category_id #parent_category_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::DataSafe::Models::CreateSensitiveTypeDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :name_pattern The value to assign to the {#name_pattern} property
    # @option attributes [String] :comment_pattern The value to assign to the {#comment_pattern} property
    # @option attributes [String] :data_pattern The value to assign to the {#data_pattern} property
    # @option attributes [String] :search_type The value to assign to the {#search_type} property
    # @option attributes [String] :default_masking_format_id The value to assign to the {#default_masking_format_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entityType'] = 'SENSITIVE_TYPE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name_pattern = attributes[:'namePattern'] if attributes[:'namePattern']

      raise 'You cannot provide both :namePattern and :name_pattern' if attributes.key?(:'namePattern') && attributes.key?(:'name_pattern')

      self.name_pattern = attributes[:'name_pattern'] if attributes[:'name_pattern']

      self.comment_pattern = attributes[:'commentPattern'] if attributes[:'commentPattern']

      raise 'You cannot provide both :commentPattern and :comment_pattern' if attributes.key?(:'commentPattern') && attributes.key?(:'comment_pattern')

      self.comment_pattern = attributes[:'comment_pattern'] if attributes[:'comment_pattern']

      self.data_pattern = attributes[:'dataPattern'] if attributes[:'dataPattern']

      raise 'You cannot provide both :dataPattern and :data_pattern' if attributes.key?(:'dataPattern') && attributes.key?(:'data_pattern')

      self.data_pattern = attributes[:'data_pattern'] if attributes[:'data_pattern']

      self.search_type = attributes[:'searchType'] if attributes[:'searchType']
      self.search_type = "OR" if search_type.nil? && !attributes.key?(:'searchType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :searchType and :search_type' if attributes.key?(:'searchType') && attributes.key?(:'search_type')

      self.search_type = attributes[:'search_type'] if attributes[:'search_type']
      self.search_type = "OR" if search_type.nil? && !attributes.key?(:'searchType') && !attributes.key?(:'search_type') # rubocop:disable Style/StringLiterals

      self.default_masking_format_id = attributes[:'defaultMaskingFormatId'] if attributes[:'defaultMaskingFormatId']

      raise 'You cannot provide both :defaultMaskingFormatId and :default_masking_format_id' if attributes.key?(:'defaultMaskingFormatId') && attributes.key?(:'default_masking_format_id')

      self.default_masking_format_id = attributes[:'default_masking_format_id'] if attributes[:'default_masking_format_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_type == other.entity_type &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        short_name == other.short_name &&
        description == other.description &&
        parent_category_id == other.parent_category_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        name_pattern == other.name_pattern &&
        comment_pattern == other.comment_pattern &&
        data_pattern == other.data_pattern &&
        search_type == other.search_type &&
        default_masking_format_id == other.default_masking_format_id
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
      [entity_type, display_name, compartment_id, short_name, description, parent_category_id, freeform_tags, defined_tags, name_pattern, comment_pattern, data_pattern, search_type, default_masking_format_id].hash
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
