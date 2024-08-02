# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a masking report.
  class DataSafe::Models::MaskingReportSummary
    # **[Required]** The OCID of the masking report.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment that contains the masking report.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the masking work request that resulted in this masking report.
    # @return [String]
    attr_accessor :masking_work_request_id

    # **[Required]** The OCID of the masking policy used.
    # @return [String]
    attr_accessor :masking_policy_id

    # **[Required]** The OCID of the target database masked.
    # @return [String]
    attr_accessor :target_id

    # **[Required]** The total number of unique sensitive types associated with the masked columns.
    # @return [Integer]
    attr_accessor :total_masked_sensitive_types

    # **[Required]** The total number of unique schemas that contain the masked columns.
    # @return [Integer]
    attr_accessor :total_masked_schemas

    # **[Required]** The total number of unique objects (tables and editioning views) that contain the masked columns.
    # @return [Integer]
    attr_accessor :total_masked_objects

    # **[Required]** The total number of masked columns.
    # @return [Integer]
    attr_accessor :total_masked_columns

    # **[Required]** The total number of masked values.
    # @return [Integer]
    attr_accessor :total_masked_values

    # **[Required]** The date and time data masking started, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339)
    # @return [DateTime]
    attr_accessor :time_masking_started

    # **[Required]** The date and time data masking finished, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339)
    # @return [DateTime]
    attr_accessor :time_masking_finished

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'masking_work_request_id': :'maskingWorkRequestId',
        'masking_policy_id': :'maskingPolicyId',
        'target_id': :'targetId',
        'total_masked_sensitive_types': :'totalMaskedSensitiveTypes',
        'total_masked_schemas': :'totalMaskedSchemas',
        'total_masked_objects': :'totalMaskedObjects',
        'total_masked_columns': :'totalMaskedColumns',
        'total_masked_values': :'totalMaskedValues',
        'time_masking_started': :'timeMaskingStarted',
        'time_masking_finished': :'timeMaskingFinished'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'masking_work_request_id': :'String',
        'masking_policy_id': :'String',
        'target_id': :'String',
        'total_masked_sensitive_types': :'Integer',
        'total_masked_schemas': :'Integer',
        'total_masked_objects': :'Integer',
        'total_masked_columns': :'Integer',
        'total_masked_values': :'Integer',
        'time_masking_started': :'DateTime',
        'time_masking_finished': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :masking_work_request_id The value to assign to the {#masking_work_request_id} property
    # @option attributes [String] :masking_policy_id The value to assign to the {#masking_policy_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [Integer] :total_masked_sensitive_types The value to assign to the {#total_masked_sensitive_types} property
    # @option attributes [Integer] :total_masked_schemas The value to assign to the {#total_masked_schemas} property
    # @option attributes [Integer] :total_masked_objects The value to assign to the {#total_masked_objects} property
    # @option attributes [Integer] :total_masked_columns The value to assign to the {#total_masked_columns} property
    # @option attributes [Integer] :total_masked_values The value to assign to the {#total_masked_values} property
    # @option attributes [DateTime] :time_masking_started The value to assign to the {#time_masking_started} property
    # @option attributes [DateTime] :time_masking_finished The value to assign to the {#time_masking_finished} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.masking_work_request_id = attributes[:'maskingWorkRequestId'] if attributes[:'maskingWorkRequestId']

      raise 'You cannot provide both :maskingWorkRequestId and :masking_work_request_id' if attributes.key?(:'maskingWorkRequestId') && attributes.key?(:'masking_work_request_id')

      self.masking_work_request_id = attributes[:'masking_work_request_id'] if attributes[:'masking_work_request_id']

      self.masking_policy_id = attributes[:'maskingPolicyId'] if attributes[:'maskingPolicyId']

      raise 'You cannot provide both :maskingPolicyId and :masking_policy_id' if attributes.key?(:'maskingPolicyId') && attributes.key?(:'masking_policy_id')

      self.masking_policy_id = attributes[:'masking_policy_id'] if attributes[:'masking_policy_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.total_masked_sensitive_types = attributes[:'totalMaskedSensitiveTypes'] if attributes[:'totalMaskedSensitiveTypes']

      raise 'You cannot provide both :totalMaskedSensitiveTypes and :total_masked_sensitive_types' if attributes.key?(:'totalMaskedSensitiveTypes') && attributes.key?(:'total_masked_sensitive_types')

      self.total_masked_sensitive_types = attributes[:'total_masked_sensitive_types'] if attributes[:'total_masked_sensitive_types']

      self.total_masked_schemas = attributes[:'totalMaskedSchemas'] if attributes[:'totalMaskedSchemas']

      raise 'You cannot provide both :totalMaskedSchemas and :total_masked_schemas' if attributes.key?(:'totalMaskedSchemas') && attributes.key?(:'total_masked_schemas')

      self.total_masked_schemas = attributes[:'total_masked_schemas'] if attributes[:'total_masked_schemas']

      self.total_masked_objects = attributes[:'totalMaskedObjects'] if attributes[:'totalMaskedObjects']

      raise 'You cannot provide both :totalMaskedObjects and :total_masked_objects' if attributes.key?(:'totalMaskedObjects') && attributes.key?(:'total_masked_objects')

      self.total_masked_objects = attributes[:'total_masked_objects'] if attributes[:'total_masked_objects']

      self.total_masked_columns = attributes[:'totalMaskedColumns'] if attributes[:'totalMaskedColumns']

      raise 'You cannot provide both :totalMaskedColumns and :total_masked_columns' if attributes.key?(:'totalMaskedColumns') && attributes.key?(:'total_masked_columns')

      self.total_masked_columns = attributes[:'total_masked_columns'] if attributes[:'total_masked_columns']

      self.total_masked_values = attributes[:'totalMaskedValues'] if attributes[:'totalMaskedValues']

      raise 'You cannot provide both :totalMaskedValues and :total_masked_values' if attributes.key?(:'totalMaskedValues') && attributes.key?(:'total_masked_values')

      self.total_masked_values = attributes[:'total_masked_values'] if attributes[:'total_masked_values']

      self.time_masking_started = attributes[:'timeMaskingStarted'] if attributes[:'timeMaskingStarted']

      raise 'You cannot provide both :timeMaskingStarted and :time_masking_started' if attributes.key?(:'timeMaskingStarted') && attributes.key?(:'time_masking_started')

      self.time_masking_started = attributes[:'time_masking_started'] if attributes[:'time_masking_started']

      self.time_masking_finished = attributes[:'timeMaskingFinished'] if attributes[:'timeMaskingFinished']

      raise 'You cannot provide both :timeMaskingFinished and :time_masking_finished' if attributes.key?(:'timeMaskingFinished') && attributes.key?(:'time_masking_finished')

      self.time_masking_finished = attributes[:'time_masking_finished'] if attributes[:'time_masking_finished']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        masking_work_request_id == other.masking_work_request_id &&
        masking_policy_id == other.masking_policy_id &&
        target_id == other.target_id &&
        total_masked_sensitive_types == other.total_masked_sensitive_types &&
        total_masked_schemas == other.total_masked_schemas &&
        total_masked_objects == other.total_masked_objects &&
        total_masked_columns == other.total_masked_columns &&
        total_masked_values == other.total_masked_values &&
        time_masking_started == other.time_masking_started &&
        time_masking_finished == other.time_masking_finished
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
      [id, compartment_id, masking_work_request_id, masking_policy_id, target_id, total_masked_sensitive_types, total_masked_schemas, total_masked_objects, total_masked_columns, total_masked_values, time_masking_started, time_masking_finished].hash
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
