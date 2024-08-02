# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Statistics showing the number of findings for each category grouped by risk levels for all
  # the targets in the specified security assessment.
  #
  # The categories include Auditing, Authorization Control, Data Encryption, Database Configuration,
  # Fine-Grained Access Control, Privileges and Roles, and User Accounts.
  # The risk levels include High Risk, Medium Risk, Low Risk, Advisory, Evaluate, and Pass.
  #
  class DataSafe::Models::SecurityAssessmentStatistics
    # The total number of targets in this security assessment.
    # @return [Integer]
    attr_accessor :targets_count

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :high_risk

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :medium_risk

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :low_risk

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :advisory

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :evaluate

    # @return [OCI::DataSafe::Models::SectionStatistics]
    attr_accessor :pass

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'targets_count': :'targetsCount',
        'high_risk': :'highRisk',
        'medium_risk': :'mediumRisk',
        'low_risk': :'lowRisk',
        'advisory': :'advisory',
        'evaluate': :'evaluate',
        'pass': :'pass'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'targets_count': :'Integer',
        'high_risk': :'OCI::DataSafe::Models::SectionStatistics',
        'medium_risk': :'OCI::DataSafe::Models::SectionStatistics',
        'low_risk': :'OCI::DataSafe::Models::SectionStatistics',
        'advisory': :'OCI::DataSafe::Models::SectionStatistics',
        'evaluate': :'OCI::DataSafe::Models::SectionStatistics',
        'pass': :'OCI::DataSafe::Models::SectionStatistics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :targets_count The value to assign to the {#targets_count} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :high_risk The value to assign to the {#high_risk} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :medium_risk The value to assign to the {#medium_risk} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :low_risk The value to assign to the {#low_risk} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :advisory The value to assign to the {#advisory} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :evaluate The value to assign to the {#evaluate} property
    # @option attributes [OCI::DataSafe::Models::SectionStatistics] :pass The value to assign to the {#pass} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.targets_count = attributes[:'targetsCount'] if attributes[:'targetsCount']

      raise 'You cannot provide both :targetsCount and :targets_count' if attributes.key?(:'targetsCount') && attributes.key?(:'targets_count')

      self.targets_count = attributes[:'targets_count'] if attributes[:'targets_count']

      self.high_risk = attributes[:'highRisk'] if attributes[:'highRisk']

      raise 'You cannot provide both :highRisk and :high_risk' if attributes.key?(:'highRisk') && attributes.key?(:'high_risk')

      self.high_risk = attributes[:'high_risk'] if attributes[:'high_risk']

      self.medium_risk = attributes[:'mediumRisk'] if attributes[:'mediumRisk']

      raise 'You cannot provide both :mediumRisk and :medium_risk' if attributes.key?(:'mediumRisk') && attributes.key?(:'medium_risk')

      self.medium_risk = attributes[:'medium_risk'] if attributes[:'medium_risk']

      self.low_risk = attributes[:'lowRisk'] if attributes[:'lowRisk']

      raise 'You cannot provide both :lowRisk and :low_risk' if attributes.key?(:'lowRisk') && attributes.key?(:'low_risk')

      self.low_risk = attributes[:'low_risk'] if attributes[:'low_risk']

      self.advisory = attributes[:'advisory'] if attributes[:'advisory']

      self.evaluate = attributes[:'evaluate'] if attributes[:'evaluate']

      self.pass = attributes[:'pass'] if attributes[:'pass']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        targets_count == other.targets_count &&
        high_risk == other.high_risk &&
        medium_risk == other.medium_risk &&
        low_risk == other.low_risk &&
        advisory == other.advisory &&
        evaluate == other.evaluate &&
        pass == other.pass
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
      [targets_count, high_risk, medium_risk, low_risk, advisory, evaluate, pass].hash
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
