# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'node_pool_pod_network_option_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Network options specific to using the OCI VCN Native CNI
  class ContainerEngine::Models::OciVcnIpNativeNodePoolPodNetworkOptionDetails < ContainerEngine::Models::NodePoolPodNetworkOptionDetails
    # The max number of pods per node in the node pool. This value will be limited by the number of VNICs attachable to the node pool shape
    #
    # @return [Integer]
    attr_accessor :max_pods_per_node

    # The OCIDs of the Network Security Group(s) to associate pods for this node pool with. For more information about NSGs, see {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :pod_nsg_ids

    # **[Required]** The OCIDs of the subnets in which to place pods for this node pool. This can be one of the node pool subnet IDs
    #
    # @return [Array<String>]
    attr_accessor :pod_subnet_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cni_type': :'cniType',
        'max_pods_per_node': :'maxPodsPerNode',
        'pod_nsg_ids': :'podNsgIds',
        'pod_subnet_ids': :'podSubnetIds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cni_type': :'String',
        'max_pods_per_node': :'Integer',
        'pod_nsg_ids': :'Array<String>',
        'pod_subnet_ids': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :max_pods_per_node The value to assign to the {#max_pods_per_node} property
    # @option attributes [Array<String>] :pod_nsg_ids The value to assign to the {#pod_nsg_ids} property
    # @option attributes [Array<String>] :pod_subnet_ids The value to assign to the {#pod_subnet_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['cniType'] = 'OCI_VCN_IP_NATIVE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_pods_per_node = attributes[:'maxPodsPerNode'] if attributes[:'maxPodsPerNode']
      self.max_pods_per_node = 31 if max_pods_per_node.nil? && !attributes.key?(:'maxPodsPerNode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :maxPodsPerNode and :max_pods_per_node' if attributes.key?(:'maxPodsPerNode') && attributes.key?(:'max_pods_per_node')

      self.max_pods_per_node = attributes[:'max_pods_per_node'] if attributes[:'max_pods_per_node']
      self.max_pods_per_node = 31 if max_pods_per_node.nil? && !attributes.key?(:'maxPodsPerNode') && !attributes.key?(:'max_pods_per_node') # rubocop:disable Style/StringLiterals

      self.pod_nsg_ids = attributes[:'podNsgIds'] if attributes[:'podNsgIds']

      raise 'You cannot provide both :podNsgIds and :pod_nsg_ids' if attributes.key?(:'podNsgIds') && attributes.key?(:'pod_nsg_ids')

      self.pod_nsg_ids = attributes[:'pod_nsg_ids'] if attributes[:'pod_nsg_ids']

      self.pod_subnet_ids = attributes[:'podSubnetIds'] if attributes[:'podSubnetIds']

      raise 'You cannot provide both :podSubnetIds and :pod_subnet_ids' if attributes.key?(:'podSubnetIds') && attributes.key?(:'pod_subnet_ids')

      self.pod_subnet_ids = attributes[:'pod_subnet_ids'] if attributes[:'pod_subnet_ids']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cni_type == other.cni_type &&
        max_pods_per_node == other.max_pods_per_node &&
        pod_nsg_ids == other.pod_nsg_ids &&
        pod_subnet_ids == other.pod_subnet_ids
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
      [cni_type, max_pods_per_node, pod_nsg_ids, pod_subnet_ids].hash
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
