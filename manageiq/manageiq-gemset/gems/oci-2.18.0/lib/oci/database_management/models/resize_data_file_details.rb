# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details required to resize a data file or temp file within the tablespace.
  class DatabaseManagement::Models::ResizeDataFileDetails
    FILE_TYPE_ENUM = [
      FILE_TYPE_DATAFILE = 'DATAFILE'.freeze,
      FILE_TYPE_TEMPFILE = 'TEMPFILE'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails]
    attr_accessor :credential_details

    # **[Required]** Specifies whether the file is a data file or temp file.
    #
    # @return [String]
    attr_reader :file_type

    # **[Required]** Name of the data file or temp file to be resized.
    #
    # @return [String]
    attr_accessor :data_file

    # The new size of the data file or temp file.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :file_size

    # Specifies whether the data file or temp file can be extended automatically.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_extensible

    # The size of the next increment of disk space to be allocated automatically when more extents are required.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :auto_extend_next_size

    # The maximum disk space allowed for automatic extension of the data files or temp files.
    #
    # @return [OCI::DatabaseManagement::Models::TablespaceStorageSize]
    attr_accessor :auto_extend_max_size

    # Specifies whether the disk space of the data file or temp file can be limited.
    #
    # @return [BOOLEAN]
    attr_accessor :is_max_size_unlimited

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'credentialDetails',
        'file_type': :'fileType',
        'data_file': :'dataFile',
        'file_size': :'fileSize',
        'is_auto_extensible': :'isAutoExtensible',
        'auto_extend_next_size': :'autoExtendNextSize',
        'auto_extend_max_size': :'autoExtendMaxSize',
        'is_max_size_unlimited': :'isMaxSizeUnlimited'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails',
        'file_type': :'String',
        'data_file': :'String',
        'file_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'is_auto_extensible': :'BOOLEAN',
        'auto_extend_next_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'auto_extend_max_size': :'OCI::DatabaseManagement::Models::TablespaceStorageSize',
        'is_max_size_unlimited': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [String] :file_type The value to assign to the {#file_type} property
    # @option attributes [String] :data_file The value to assign to the {#data_file} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :file_size The value to assign to the {#file_size} property
    # @option attributes [BOOLEAN] :is_auto_extensible The value to assign to the {#is_auto_extensible} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :auto_extend_next_size The value to assign to the {#auto_extend_next_size} property
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceStorageSize] :auto_extend_max_size The value to assign to the {#auto_extend_max_size} property
    # @option attributes [BOOLEAN] :is_max_size_unlimited The value to assign to the {#is_max_size_unlimited} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.file_type = attributes[:'fileType'] if attributes[:'fileType']

      raise 'You cannot provide both :fileType and :file_type' if attributes.key?(:'fileType') && attributes.key?(:'file_type')

      self.file_type = attributes[:'file_type'] if attributes[:'file_type']

      self.data_file = attributes[:'dataFile'] if attributes[:'dataFile']

      raise 'You cannot provide both :dataFile and :data_file' if attributes.key?(:'dataFile') && attributes.key?(:'data_file')

      self.data_file = attributes[:'data_file'] if attributes[:'data_file']

      self.file_size = attributes[:'fileSize'] if attributes[:'fileSize']

      raise 'You cannot provide both :fileSize and :file_size' if attributes.key?(:'fileSize') && attributes.key?(:'file_size')

      self.file_size = attributes[:'file_size'] if attributes[:'file_size']

      self.is_auto_extensible = attributes[:'isAutoExtensible'] unless attributes[:'isAutoExtensible'].nil?

      raise 'You cannot provide both :isAutoExtensible and :is_auto_extensible' if attributes.key?(:'isAutoExtensible') && attributes.key?(:'is_auto_extensible')

      self.is_auto_extensible = attributes[:'is_auto_extensible'] unless attributes[:'is_auto_extensible'].nil?

      self.auto_extend_next_size = attributes[:'autoExtendNextSize'] if attributes[:'autoExtendNextSize']

      raise 'You cannot provide both :autoExtendNextSize and :auto_extend_next_size' if attributes.key?(:'autoExtendNextSize') && attributes.key?(:'auto_extend_next_size')

      self.auto_extend_next_size = attributes[:'auto_extend_next_size'] if attributes[:'auto_extend_next_size']

      self.auto_extend_max_size = attributes[:'autoExtendMaxSize'] if attributes[:'autoExtendMaxSize']

      raise 'You cannot provide both :autoExtendMaxSize and :auto_extend_max_size' if attributes.key?(:'autoExtendMaxSize') && attributes.key?(:'auto_extend_max_size')

      self.auto_extend_max_size = attributes[:'auto_extend_max_size'] if attributes[:'auto_extend_max_size']

      self.is_max_size_unlimited = attributes[:'isMaxSizeUnlimited'] unless attributes[:'isMaxSizeUnlimited'].nil?

      raise 'You cannot provide both :isMaxSizeUnlimited and :is_max_size_unlimited' if attributes.key?(:'isMaxSizeUnlimited') && attributes.key?(:'is_max_size_unlimited')

      self.is_max_size_unlimited = attributes[:'is_max_size_unlimited'] unless attributes[:'is_max_size_unlimited'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] file_type Object to be assigned
    def file_type=(file_type)
      raise "Invalid value for 'file_type': this must be one of the values in FILE_TYPE_ENUM." if file_type && !FILE_TYPE_ENUM.include?(file_type)

      @file_type = file_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_details == other.credential_details &&
        file_type == other.file_type &&
        data_file == other.data_file &&
        file_size == other.file_size &&
        is_auto_extensible == other.is_auto_extensible &&
        auto_extend_next_size == other.auto_extend_next_size &&
        auto_extend_max_size == other.auto_extend_max_size &&
        is_max_size_unlimited == other.is_max_size_unlimited
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
      [credential_details, file_type, data_file, file_size, is_auto_extensible, auto_extend_next_size, auto_extend_max_size, is_max_size_unlimited].hash
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
