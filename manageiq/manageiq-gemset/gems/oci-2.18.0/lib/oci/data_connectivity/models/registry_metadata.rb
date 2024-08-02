# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the object and its parent.
  class DataConnectivity::Models::RegistryMetadata
    # The owning object's key for this object.
    # @return [String]
    attr_accessor :aggregator_key

    # Labels are keywords or labels that you can add to data assets, dataflows etc. You can define your own labels and use them to categorize content.
    # @return [Array<String>]
    attr_accessor :labels

    # The registry version.
    # @return [Integer]
    attr_accessor :registry_version

    # The identifying key for the object.
    # @return [String]
    attr_accessor :key

    # Specifies whether this object is a favorite or not.
    # @return [BOOLEAN]
    attr_accessor :is_favorite

    # The id of the user who created the object.
    # @return [String]
    attr_accessor :created_by_user_id

    # The name of the user who created the object.
    # @return [String]
    attr_accessor :created_by_user_name

    # The id of the user who updated the object.
    # @return [String]
    attr_accessor :updated_by_user_id

    # The name of the user who updated the object.
    # @return [String]
    attr_accessor :updated_by_user_name

    # The date and time that the object was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time that the object was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'aggregator_key': :'aggregatorKey',
        'labels': :'labels',
        'registry_version': :'registryVersion',
        'key': :'key',
        'is_favorite': :'isFavorite',
        'created_by_user_id': :'createdByUserId',
        'created_by_user_name': :'createdByUserName',
        'updated_by_user_id': :'updatedByUserId',
        'updated_by_user_name': :'updatedByUserName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'aggregator_key': :'String',
        'labels': :'Array<String>',
        'registry_version': :'Integer',
        'key': :'String',
        'is_favorite': :'BOOLEAN',
        'created_by_user_id': :'String',
        'created_by_user_name': :'String',
        'updated_by_user_id': :'String',
        'updated_by_user_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :aggregator_key The value to assign to the {#aggregator_key} property
    # @option attributes [Array<String>] :labels The value to assign to the {#labels} property
    # @option attributes [Integer] :registry_version The value to assign to the {#registry_version} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [BOOLEAN] :is_favorite The value to assign to the {#is_favorite} property
    # @option attributes [String] :created_by_user_id The value to assign to the {#created_by_user_id} property
    # @option attributes [String] :created_by_user_name The value to assign to the {#created_by_user_name} property
    # @option attributes [String] :updated_by_user_id The value to assign to the {#updated_by_user_id} property
    # @option attributes [String] :updated_by_user_name The value to assign to the {#updated_by_user_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.aggregator_key = attributes[:'aggregatorKey'] if attributes[:'aggregatorKey']

      raise 'You cannot provide both :aggregatorKey and :aggregator_key' if attributes.key?(:'aggregatorKey') && attributes.key?(:'aggregator_key')

      self.aggregator_key = attributes[:'aggregator_key'] if attributes[:'aggregator_key']

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.registry_version = attributes[:'registryVersion'] if attributes[:'registryVersion']

      raise 'You cannot provide both :registryVersion and :registry_version' if attributes.key?(:'registryVersion') && attributes.key?(:'registry_version')

      self.registry_version = attributes[:'registry_version'] if attributes[:'registry_version']

      self.key = attributes[:'key'] if attributes[:'key']

      self.is_favorite = attributes[:'isFavorite'] unless attributes[:'isFavorite'].nil?
      self.is_favorite = false if is_favorite.nil? && !attributes.key?(:'isFavorite') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isFavorite and :is_favorite' if attributes.key?(:'isFavorite') && attributes.key?(:'is_favorite')

      self.is_favorite = attributes[:'is_favorite'] unless attributes[:'is_favorite'].nil?
      self.is_favorite = false if is_favorite.nil? && !attributes.key?(:'isFavorite') && !attributes.key?(:'is_favorite') # rubocop:disable Style/StringLiterals

      self.created_by_user_id = attributes[:'createdByUserId'] if attributes[:'createdByUserId']

      raise 'You cannot provide both :createdByUserId and :created_by_user_id' if attributes.key?(:'createdByUserId') && attributes.key?(:'created_by_user_id')

      self.created_by_user_id = attributes[:'created_by_user_id'] if attributes[:'created_by_user_id']

      self.created_by_user_name = attributes[:'createdByUserName'] if attributes[:'createdByUserName']

      raise 'You cannot provide both :createdByUserName and :created_by_user_name' if attributes.key?(:'createdByUserName') && attributes.key?(:'created_by_user_name')

      self.created_by_user_name = attributes[:'created_by_user_name'] if attributes[:'created_by_user_name']

      self.updated_by_user_id = attributes[:'updatedByUserId'] if attributes[:'updatedByUserId']

      raise 'You cannot provide both :updatedByUserId and :updated_by_user_id' if attributes.key?(:'updatedByUserId') && attributes.key?(:'updated_by_user_id')

      self.updated_by_user_id = attributes[:'updated_by_user_id'] if attributes[:'updated_by_user_id']

      self.updated_by_user_name = attributes[:'updatedByUserName'] if attributes[:'updatedByUserName']

      raise 'You cannot provide both :updatedByUserName and :updated_by_user_name' if attributes.key?(:'updatedByUserName') && attributes.key?(:'updated_by_user_name')

      self.updated_by_user_name = attributes[:'updated_by_user_name'] if attributes[:'updated_by_user_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        aggregator_key == other.aggregator_key &&
        labels == other.labels &&
        registry_version == other.registry_version &&
        key == other.key &&
        is_favorite == other.is_favorite &&
        created_by_user_id == other.created_by_user_id &&
        created_by_user_name == other.created_by_user_name &&
        updated_by_user_id == other.updated_by_user_id &&
        updated_by_user_name == other.updated_by_user_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [aggregator_key, labels, registry_version, key, is_favorite, created_by_user_id, created_by_user_name, updated_by_user_id, updated_by_user_name, time_created, time_updated].hash
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
