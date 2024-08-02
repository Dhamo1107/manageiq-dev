# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Scale operation details for a blockchain platform. The scale operation payload has multiple options
  # - Add one or more Ordering Service Node (addOsns)
  # - Add one or more Peers (addPeers)
  # - Add more replicas of CA, Console and Rest Proxy (addReplicas)
  # - Add more storage to the platform (addStorage)
  # - Modify the CPU allocation for Peer Nodes (modifyPeers)
  # - Remove one or more replicas of CA, Console and Rest Proxy (removeReplicas)
  # - Remove one or more Ordering Service Node (removeOsns)
  # - Remove one or more Peers (removePeers).
  # The scale operation payload must have at least one of the above options.
  #
  class Blockchain::Models::ScaleBlockchainPlatformDetails
    # new OSNs to add
    # @return [Array<OCI::Blockchain::Models::CreateOsnDetails>]
    attr_accessor :add_osns

    # @return [OCI::Blockchain::Models::ReplicaDetails]
    attr_accessor :add_replicas

    # new Peers to add
    # @return [Array<OCI::Blockchain::Models::CreatePeerDetails>]
    attr_accessor :add_peers

    # @return [OCI::Blockchain::Models::ScaleStorageDetails]
    attr_accessor :add_storage

    # modify ocpu allocation to existing Peers
    # @return [Array<OCI::Blockchain::Models::ModifyPeerDetails>]
    attr_accessor :modify_peers

    # @return [OCI::Blockchain::Models::ReplicaDetails]
    attr_accessor :remove_replicas

    # OSN id list to remove
    # @return [Array<String>]
    attr_accessor :remove_osns

    # Peer id list to remove
    # @return [Array<String>]
    attr_accessor :remove_peers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'add_osns': :'addOsns',
        'add_replicas': :'addReplicas',
        'add_peers': :'addPeers',
        'add_storage': :'addStorage',
        'modify_peers': :'modifyPeers',
        'remove_replicas': :'removeReplicas',
        'remove_osns': :'removeOsns',
        'remove_peers': :'removePeers'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'add_osns': :'Array<OCI::Blockchain::Models::CreateOsnDetails>',
        'add_replicas': :'OCI::Blockchain::Models::ReplicaDetails',
        'add_peers': :'Array<OCI::Blockchain::Models::CreatePeerDetails>',
        'add_storage': :'OCI::Blockchain::Models::ScaleStorageDetails',
        'modify_peers': :'Array<OCI::Blockchain::Models::ModifyPeerDetails>',
        'remove_replicas': :'OCI::Blockchain::Models::ReplicaDetails',
        'remove_osns': :'Array<String>',
        'remove_peers': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Blockchain::Models::CreateOsnDetails>] :add_osns The value to assign to the {#add_osns} property
    # @option attributes [OCI::Blockchain::Models::ReplicaDetails] :add_replicas The value to assign to the {#add_replicas} property
    # @option attributes [Array<OCI::Blockchain::Models::CreatePeerDetails>] :add_peers The value to assign to the {#add_peers} property
    # @option attributes [OCI::Blockchain::Models::ScaleStorageDetails] :add_storage The value to assign to the {#add_storage} property
    # @option attributes [Array<OCI::Blockchain::Models::ModifyPeerDetails>] :modify_peers The value to assign to the {#modify_peers} property
    # @option attributes [OCI::Blockchain::Models::ReplicaDetails] :remove_replicas The value to assign to the {#remove_replicas} property
    # @option attributes [Array<String>] :remove_osns The value to assign to the {#remove_osns} property
    # @option attributes [Array<String>] :remove_peers The value to assign to the {#remove_peers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.add_osns = attributes[:'addOsns'] if attributes[:'addOsns']

      raise 'You cannot provide both :addOsns and :add_osns' if attributes.key?(:'addOsns') && attributes.key?(:'add_osns')

      self.add_osns = attributes[:'add_osns'] if attributes[:'add_osns']

      self.add_replicas = attributes[:'addReplicas'] if attributes[:'addReplicas']

      raise 'You cannot provide both :addReplicas and :add_replicas' if attributes.key?(:'addReplicas') && attributes.key?(:'add_replicas')

      self.add_replicas = attributes[:'add_replicas'] if attributes[:'add_replicas']

      self.add_peers = attributes[:'addPeers'] if attributes[:'addPeers']

      raise 'You cannot provide both :addPeers and :add_peers' if attributes.key?(:'addPeers') && attributes.key?(:'add_peers')

      self.add_peers = attributes[:'add_peers'] if attributes[:'add_peers']

      self.add_storage = attributes[:'addStorage'] if attributes[:'addStorage']

      raise 'You cannot provide both :addStorage and :add_storage' if attributes.key?(:'addStorage') && attributes.key?(:'add_storage')

      self.add_storage = attributes[:'add_storage'] if attributes[:'add_storage']

      self.modify_peers = attributes[:'modifyPeers'] if attributes[:'modifyPeers']

      raise 'You cannot provide both :modifyPeers and :modify_peers' if attributes.key?(:'modifyPeers') && attributes.key?(:'modify_peers')

      self.modify_peers = attributes[:'modify_peers'] if attributes[:'modify_peers']

      self.remove_replicas = attributes[:'removeReplicas'] if attributes[:'removeReplicas']

      raise 'You cannot provide both :removeReplicas and :remove_replicas' if attributes.key?(:'removeReplicas') && attributes.key?(:'remove_replicas')

      self.remove_replicas = attributes[:'remove_replicas'] if attributes[:'remove_replicas']

      self.remove_osns = attributes[:'removeOsns'] if attributes[:'removeOsns']

      raise 'You cannot provide both :removeOsns and :remove_osns' if attributes.key?(:'removeOsns') && attributes.key?(:'remove_osns')

      self.remove_osns = attributes[:'remove_osns'] if attributes[:'remove_osns']

      self.remove_peers = attributes[:'removePeers'] if attributes[:'removePeers']

      raise 'You cannot provide both :removePeers and :remove_peers' if attributes.key?(:'removePeers') && attributes.key?(:'remove_peers')

      self.remove_peers = attributes[:'remove_peers'] if attributes[:'remove_peers']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        add_osns == other.add_osns &&
        add_replicas == other.add_replicas &&
        add_peers == other.add_peers &&
        add_storage == other.add_storage &&
        modify_peers == other.modify_peers &&
        remove_replicas == other.remove_replicas &&
        remove_osns == other.remove_osns &&
        remove_peers == other.remove_peers
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
      [add_osns, add_replicas, add_peers, add_storage, modify_peers, remove_replicas, remove_osns, remove_peers].hash
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
