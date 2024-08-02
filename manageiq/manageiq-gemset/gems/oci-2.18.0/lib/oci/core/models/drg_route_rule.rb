# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A DRG route rule is a mapping between a destination IP address range and a DRG attachment.
  # The map is used to route matching packets. Traffic will be routed across the attachments using Equal-cost multi-path routing (ECMP)
  # if there are multiple rules with identical destinations and none of the rules conflict.
  #
  class Core::Models::DrgRouteRule
    DESTINATION_TYPE_ENUM = [
      DESTINATION_TYPE_CIDR_BLOCK = 'CIDR_BLOCK'.freeze,
      DESTINATION_TYPE_SERVICE_CIDR_BLOCK = 'SERVICE_CIDR_BLOCK'.freeze,
      DESTINATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROUTE_TYPE_ENUM = [
      ROUTE_TYPE_STATIC = 'STATIC'.freeze,
      ROUTE_TYPE_DYNAMIC = 'DYNAMIC'.freeze,
      ROUTE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROUTE_PROVENANCE_ENUM = [
      ROUTE_PROVENANCE_STATIC = 'STATIC'.freeze,
      ROUTE_PROVENANCE_VCN = 'VCN'.freeze,
      ROUTE_PROVENANCE_VIRTUAL_CIRCUIT = 'VIRTUAL_CIRCUIT'.freeze,
      ROUTE_PROVENANCE_IPSEC_TUNNEL = 'IPSEC_TUNNEL'.freeze,
      ROUTE_PROVENANCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Represents the range of IP addresses to match against when routing traffic.
    #
    # Potential values:
    #   * An IP address range (IPv4 or IPv6) in CIDR notation. For example: `192.168.1.0/24`
    #   or `2001:0db8:0123:45::/56`.
    #   * When you're setting up a security rule for traffic destined for a particular `Service` through
    #   a service gateway, this is the `cidrBlock` value associated with that {Service}. For example: `oci-phx-objectstorage`.
    #
    # @return [String]
    attr_accessor :destination

    # **[Required]** The type of destination for the rule. the type is required if `direction` = `EGRESS`.
    #
    # Allowed values:
    #
    #   * `CIDR_BLOCK`: If the rule's `destination` is an IP address range in CIDR notation.
    #   * `SERVICE_CIDR_BLOCK`: If the rule's `destination` is the `cidrBlock` value for a
    #     {Service} (the rule is for traffic destined for a
    #     particular `Service` through a service gateway).
    #
    # @return [String]
    attr_reader :destination_type

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the next hop DRG attachment responsible
    # for reaching the network destination.
    #
    # A value of `BLACKHOLE` means traffic for this route is discarded without notification.
    #
    # @return [String]
    attr_accessor :next_hop_drg_attachment_id

    # You can specify static routes for the DRG route table using the API.
    # The DRG learns dynamic routes from the DRG attachments using various routing protocols.
    #
    # @return [String]
    attr_reader :route_type

    # Indicates that the route was not imported due to a conflict between route rules.
    #
    # @return [BOOLEAN]
    attr_accessor :is_conflict

    # Indicates that if the next hop attachment does not exist, so traffic for this route is discarded without notification.
    #
    # @return [BOOLEAN]
    attr_accessor :is_blackhole

    # **[Required]** The Oracle-assigned ID of the DRG route rule.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The earliest origin of a route. If a route is advertised to a DRG through an IPsec tunnel attachment,
    # and is propagated to peered DRGs via RPC attachments, the route's provenance in the peered DRGs remains `IPSEC_TUNNEL`,
    # because that is the earliest origin.
    #
    # No routes with a provenance `IPSEC_TUNNEL` or `VIRTUAL_CIRCUIT` will be exported to IPsec tunnel or virtual circuit attachments,
    # regardless of the attachment's export distribution.
    #
    # @return [String]
    attr_reader :route_provenance

    # Additional properties for the route, computed by the service.
    #
    # @return [Object]
    attr_accessor :attributes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'destination': :'destination',
        'destination_type': :'destinationType',
        'next_hop_drg_attachment_id': :'nextHopDrgAttachmentId',
        'route_type': :'routeType',
        'is_conflict': :'isConflict',
        'is_blackhole': :'isBlackhole',
        'id': :'id',
        'route_provenance': :'routeProvenance',
        'attributes': :'attributes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'destination': :'String',
        'destination_type': :'String',
        'next_hop_drg_attachment_id': :'String',
        'route_type': :'String',
        'is_conflict': :'BOOLEAN',
        'is_blackhole': :'BOOLEAN',
        'id': :'String',
        'route_provenance': :'String',
        'attributes': :'Object'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :destination The value to assign to the {#destination} property
    # @option attributes [String] :destination_type The value to assign to the {#destination_type} property
    # @option attributes [String] :next_hop_drg_attachment_id The value to assign to the {#next_hop_drg_attachment_id} property
    # @option attributes [String] :route_type The value to assign to the {#route_type} property
    # @option attributes [BOOLEAN] :is_conflict The value to assign to the {#is_conflict} property
    # @option attributes [BOOLEAN] :is_blackhole The value to assign to the {#is_blackhole} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :route_provenance The value to assign to the {#route_provenance} property
    # @option attributes [Object] :attributes The value to assign to the {#attributes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.destination = attributes[:'destination'] if attributes[:'destination']

      self.destination_type = attributes[:'destinationType'] if attributes[:'destinationType']

      raise 'You cannot provide both :destinationType and :destination_type' if attributes.key?(:'destinationType') && attributes.key?(:'destination_type')

      self.destination_type = attributes[:'destination_type'] if attributes[:'destination_type']

      self.next_hop_drg_attachment_id = attributes[:'nextHopDrgAttachmentId'] if attributes[:'nextHopDrgAttachmentId']

      raise 'You cannot provide both :nextHopDrgAttachmentId and :next_hop_drg_attachment_id' if attributes.key?(:'nextHopDrgAttachmentId') && attributes.key?(:'next_hop_drg_attachment_id')

      self.next_hop_drg_attachment_id = attributes[:'next_hop_drg_attachment_id'] if attributes[:'next_hop_drg_attachment_id']

      self.route_type = attributes[:'routeType'] if attributes[:'routeType']

      raise 'You cannot provide both :routeType and :route_type' if attributes.key?(:'routeType') && attributes.key?(:'route_type')

      self.route_type = attributes[:'route_type'] if attributes[:'route_type']

      self.is_conflict = attributes[:'isConflict'] unless attributes[:'isConflict'].nil?
      self.is_conflict = false if is_conflict.nil? && !attributes.key?(:'isConflict') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isConflict and :is_conflict' if attributes.key?(:'isConflict') && attributes.key?(:'is_conflict')

      self.is_conflict = attributes[:'is_conflict'] unless attributes[:'is_conflict'].nil?
      self.is_conflict = false if is_conflict.nil? && !attributes.key?(:'isConflict') && !attributes.key?(:'is_conflict') # rubocop:disable Style/StringLiterals

      self.is_blackhole = attributes[:'isBlackhole'] unless attributes[:'isBlackhole'].nil?
      self.is_blackhole = false if is_blackhole.nil? && !attributes.key?(:'isBlackhole') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBlackhole and :is_blackhole' if attributes.key?(:'isBlackhole') && attributes.key?(:'is_blackhole')

      self.is_blackhole = attributes[:'is_blackhole'] unless attributes[:'is_blackhole'].nil?
      self.is_blackhole = false if is_blackhole.nil? && !attributes.key?(:'isBlackhole') && !attributes.key?(:'is_blackhole') # rubocop:disable Style/StringLiterals

      self.id = attributes[:'id'] if attributes[:'id']

      self.route_provenance = attributes[:'routeProvenance'] if attributes[:'routeProvenance']

      raise 'You cannot provide both :routeProvenance and :route_provenance' if attributes.key?(:'routeProvenance') && attributes.key?(:'route_provenance')

      self.route_provenance = attributes[:'route_provenance'] if attributes[:'route_provenance']

      self.attributes = attributes[:'attributes'] if attributes[:'attributes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] destination_type Object to be assigned
    def destination_type=(destination_type)
      # rubocop:disable Style/ConditionalAssignment
      if destination_type && !DESTINATION_TYPE_ENUM.include?(destination_type)
        OCI.logger.debug("Unknown value for 'destination_type' [" + destination_type + "]. Mapping to 'DESTINATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @destination_type = DESTINATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @destination_type = destination_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] route_type Object to be assigned
    def route_type=(route_type)
      # rubocop:disable Style/ConditionalAssignment
      if route_type && !ROUTE_TYPE_ENUM.include?(route_type)
        OCI.logger.debug("Unknown value for 'route_type' [" + route_type + "]. Mapping to 'ROUTE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @route_type = ROUTE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @route_type = route_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] route_provenance Object to be assigned
    def route_provenance=(route_provenance)
      # rubocop:disable Style/ConditionalAssignment
      if route_provenance && !ROUTE_PROVENANCE_ENUM.include?(route_provenance)
        OCI.logger.debug("Unknown value for 'route_provenance' [" + route_provenance + "]. Mapping to 'ROUTE_PROVENANCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @route_provenance = ROUTE_PROVENANCE_UNKNOWN_ENUM_VALUE
      else
        @route_provenance = route_provenance
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        destination == other.destination &&
        destination_type == other.destination_type &&
        next_hop_drg_attachment_id == other.next_hop_drg_attachment_id &&
        route_type == other.route_type &&
        is_conflict == other.is_conflict &&
        is_blackhole == other.is_blackhole &&
        id == other.id &&
        route_provenance == other.route_provenance &&
        attributes == other.attributes
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
      [destination, destination_type, next_hop_drg_attachment_id, route_type, is_conflict, is_blackhole, id, route_provenance, attributes].hash
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
