# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details needed when adding a DRG route rule.
  #
  class VnMonitoring::Models::AddDrgRouteRuleDetails
    DESTINATION_TYPE_ENUM = [
      DESTINATION_TYPE_CIDR_BLOCK = 'CIDR_BLOCK'.freeze
    ].freeze

    # **[Required]** Type of destination for the rule. Required if `direction` = `EGRESS`.
    # Allowed values:
    #   * `CIDR_BLOCK`: If the rule's `destination` is an IP address range in CIDR notation.
    #
    # @return [String]
    attr_reader :destination_type

    # **[Required]** This is the range of IP addresses used for matching when routing
    # traffic. Only CIDR_BLOCK values are allowed.
    #
    # Potential values:
    #   * IP address range in CIDR notation. This can be an IPv4 or IPv6 CIDR. For example: `192.168.1.0/24`
    #   or `2001:0db8:0123:45::/56`.
    #
    # @return [String]
    attr_accessor :destination

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the next hop DRG attachment. The next hop DRG attachment is responsible
    # for reaching the network destination.
    #
    # @return [String]
    attr_accessor :next_hop_drg_attachment_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'destination_type': :'destinationType',
        'destination': :'destination',
        'next_hop_drg_attachment_id': :'nextHopDrgAttachmentId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'destination_type': :'String',
        'destination': :'String',
        'next_hop_drg_attachment_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :destination_type The value to assign to the {#destination_type} property
    # @option attributes [String] :destination The value to assign to the {#destination} property
    # @option attributes [String] :next_hop_drg_attachment_id The value to assign to the {#next_hop_drg_attachment_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.destination_type = attributes[:'destinationType'] if attributes[:'destinationType']

      raise 'You cannot provide both :destinationType and :destination_type' if attributes.key?(:'destinationType') && attributes.key?(:'destination_type')

      self.destination_type = attributes[:'destination_type'] if attributes[:'destination_type']

      self.destination = attributes[:'destination'] if attributes[:'destination']

      self.next_hop_drg_attachment_id = attributes[:'nextHopDrgAttachmentId'] if attributes[:'nextHopDrgAttachmentId']

      raise 'You cannot provide both :nextHopDrgAttachmentId and :next_hop_drg_attachment_id' if attributes.key?(:'nextHopDrgAttachmentId') && attributes.key?(:'next_hop_drg_attachment_id')

      self.next_hop_drg_attachment_id = attributes[:'next_hop_drg_attachment_id'] if attributes[:'next_hop_drg_attachment_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] destination_type Object to be assigned
    def destination_type=(destination_type)
      raise "Invalid value for 'destination_type': this must be one of the values in DESTINATION_TYPE_ENUM." if destination_type && !DESTINATION_TYPE_ENUM.include?(destination_type)

      @destination_type = destination_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        destination_type == other.destination_type &&
        destination == other.destination &&
        next_hop_drg_attachment_id == other.next_hop_drg_attachment_id
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
      [destination_type, destination, next_hop_drg_attachment_id].hash
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
