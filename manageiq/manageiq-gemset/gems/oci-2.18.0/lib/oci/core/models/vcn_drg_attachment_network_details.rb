# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'drg_attachment_network_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies details within the VCN.
  class Core::Models::VcnDrgAttachmentNetworkDetails < Core::Models::DrgAttachmentNetworkDetails
    VCN_ROUTE_TYPE_ENUM = [
      VCN_ROUTE_TYPE_VCN_CIDRS = 'VCN_CIDRS'.freeze,
      VCN_ROUTE_TYPE_SUBNET_CIDRS = 'SUBNET_CIDRS'.freeze,
      VCN_ROUTE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table the DRG attachment is using.
    #
    # For information about why you would associate a route table with a DRG attachment, see:
    #
    #   * [Transit Routing: Access to Multiple VCNs in Same Region](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/transitrouting.htm)
    #   * [Transit Routing: Private Access to Oracle Services](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/transitroutingoracleservices.htm)
    #
    # @return [String]
    attr_accessor :route_table_id

    # Indicates whether the VCN CIDRs or the individual subnet CIDRs are imported from the attachment.
    # Routes from the VCN ingress route table are always imported.
    #
    # @return [String]
    attr_reader :vcn_route_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'id': :'id',
        'route_table_id': :'routeTableId',
        'vcn_route_type': :'vcnRouteType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'id': :'String',
        'route_table_id': :'String',
        'vcn_route_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Core::Models::DrgAttachmentNetworkDetails#id #id} proprety
    # @option attributes [String] :route_table_id The value to assign to the {#route_table_id} property
    # @option attributes [String] :vcn_route_type The value to assign to the {#vcn_route_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'VCN'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.route_table_id = attributes[:'routeTableId'] if attributes[:'routeTableId']

      raise 'You cannot provide both :routeTableId and :route_table_id' if attributes.key?(:'routeTableId') && attributes.key?(:'route_table_id')

      self.route_table_id = attributes[:'route_table_id'] if attributes[:'route_table_id']

      self.vcn_route_type = attributes[:'vcnRouteType'] if attributes[:'vcnRouteType']
      self.vcn_route_type = "SUBNET_CIDRS" if vcn_route_type.nil? && !attributes.key?(:'vcnRouteType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :vcnRouteType and :vcn_route_type' if attributes.key?(:'vcnRouteType') && attributes.key?(:'vcn_route_type')

      self.vcn_route_type = attributes[:'vcn_route_type'] if attributes[:'vcn_route_type']
      self.vcn_route_type = "SUBNET_CIDRS" if vcn_route_type.nil? && !attributes.key?(:'vcnRouteType') && !attributes.key?(:'vcn_route_type') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vcn_route_type Object to be assigned
    def vcn_route_type=(vcn_route_type)
      # rubocop:disable Style/ConditionalAssignment
      if vcn_route_type && !VCN_ROUTE_TYPE_ENUM.include?(vcn_route_type)
        OCI.logger.debug("Unknown value for 'vcn_route_type' [" + vcn_route_type + "]. Mapping to 'VCN_ROUTE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @vcn_route_type = VCN_ROUTE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @vcn_route_type = vcn_route_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        id == other.id &&
        route_table_id == other.route_table_id &&
        vcn_route_type == other.vcn_route_type
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
      [type, id, route_table_id, vcn_route_type].hash
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
