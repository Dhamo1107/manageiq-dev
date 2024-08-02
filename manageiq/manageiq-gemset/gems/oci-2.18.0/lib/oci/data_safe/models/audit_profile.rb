# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The resource represents audit profile settings and audit configurations for the database target, and helps evaluate the initial audit data volume for configuring collection in Data Safe. The resource is also responsible for auto-discovery of audit trails in the database target during target's registration.
  class DataSafe::Models::AuditProfile
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the audit profile.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment that contains the audit.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The display name of the audit profile.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The date and time the audit profile was created, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the audit profile was updated, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the audit profile.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the current state of the audit profile in Data Safe.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The OCID of the Data Safe target for which the audit profile is created.
    # @return [String]
    attr_accessor :target_id

    # The description of the audit profile.
    # @return [String]
    attr_accessor :description

    # Indicates the list of available audit trails on the target.
    # @return [Array<OCI::DataSafe::Models::AuditTrail>]
    attr_accessor :audit_trails

    # **[Required]** Indicates if you want to continue collecting audit records beyond the free limit of one million audit records per month per target database,
    # potentially incurring additional charges. The default value is inherited from the global settings.
    # You can change at the global level or at the target level.
    #
    # @return [BOOLEAN]
    attr_accessor :is_paid_usage_enabled

    # **[Required]** Indicates the number of months the audit records will be stored online in Oracle Data Safe audit repository for immediate reporting and analysis.
    # Minimum: 1; Maximum:12 months
    #
    # @return [Integer]
    attr_accessor :online_months

    # **[Required]** Indicates the number of months the audit records will be stored offline in the Data Safe audit archive.
    # Minimum: 0; Maximum: 72 months.
    # If you have a requirement to store the audit data even longer in archive, please contact the Oracle Support.
    #
    # @return [Integer]
    attr_accessor :offline_months

    # Indicates number of audit records collected by Data Safe in the current calendar month.
    # Audit records for the Data Safe service account are excluded and are not counted towards your monthly free limit.
    #
    # @return [Integer]
    attr_accessor :audit_collected_volume

    # **[Required]** Indicates whether audit retention settings like online and offline months is set at the
    # target level overriding the global audit retention settings.
    #
    # @return [BOOLEAN]
    attr_accessor :is_override_global_retention_setting

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'target_id': :'targetId',
        'description': :'description',
        'audit_trails': :'auditTrails',
        'is_paid_usage_enabled': :'isPaidUsageEnabled',
        'online_months': :'onlineMonths',
        'offline_months': :'offlineMonths',
        'audit_collected_volume': :'auditCollectedVolume',
        'is_override_global_retention_setting': :'isOverrideGlobalRetentionSetting',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'target_id': :'String',
        'description': :'String',
        'audit_trails': :'Array<OCI::DataSafe::Models::AuditTrail>',
        'is_paid_usage_enabled': :'BOOLEAN',
        'online_months': :'Integer',
        'offline_months': :'Integer',
        'audit_collected_volume': :'Integer',
        'is_override_global_retention_setting': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<OCI::DataSafe::Models::AuditTrail>] :audit_trails The value to assign to the {#audit_trails} property
    # @option attributes [BOOLEAN] :is_paid_usage_enabled The value to assign to the {#is_paid_usage_enabled} property
    # @option attributes [Integer] :online_months The value to assign to the {#online_months} property
    # @option attributes [Integer] :offline_months The value to assign to the {#offline_months} property
    # @option attributes [Integer] :audit_collected_volume The value to assign to the {#audit_collected_volume} property
    # @option attributes [BOOLEAN] :is_override_global_retention_setting The value to assign to the {#is_override_global_retention_setting} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.audit_trails = attributes[:'auditTrails'] if attributes[:'auditTrails']

      raise 'You cannot provide both :auditTrails and :audit_trails' if attributes.key?(:'auditTrails') && attributes.key?(:'audit_trails')

      self.audit_trails = attributes[:'audit_trails'] if attributes[:'audit_trails']

      self.is_paid_usage_enabled = attributes[:'isPaidUsageEnabled'] unless attributes[:'isPaidUsageEnabled'].nil?

      raise 'You cannot provide both :isPaidUsageEnabled and :is_paid_usage_enabled' if attributes.key?(:'isPaidUsageEnabled') && attributes.key?(:'is_paid_usage_enabled')

      self.is_paid_usage_enabled = attributes[:'is_paid_usage_enabled'] unless attributes[:'is_paid_usage_enabled'].nil?

      self.online_months = attributes[:'onlineMonths'] if attributes[:'onlineMonths']

      raise 'You cannot provide both :onlineMonths and :online_months' if attributes.key?(:'onlineMonths') && attributes.key?(:'online_months')

      self.online_months = attributes[:'online_months'] if attributes[:'online_months']

      self.offline_months = attributes[:'offlineMonths'] if attributes[:'offlineMonths']

      raise 'You cannot provide both :offlineMonths and :offline_months' if attributes.key?(:'offlineMonths') && attributes.key?(:'offline_months')

      self.offline_months = attributes[:'offline_months'] if attributes[:'offline_months']

      self.audit_collected_volume = attributes[:'auditCollectedVolume'] if attributes[:'auditCollectedVolume']

      raise 'You cannot provide both :auditCollectedVolume and :audit_collected_volume' if attributes.key?(:'auditCollectedVolume') && attributes.key?(:'audit_collected_volume')

      self.audit_collected_volume = attributes[:'audit_collected_volume'] if attributes[:'audit_collected_volume']

      self.is_override_global_retention_setting = attributes[:'isOverrideGlobalRetentionSetting'] unless attributes[:'isOverrideGlobalRetentionSetting'].nil?

      raise 'You cannot provide both :isOverrideGlobalRetentionSetting and :is_override_global_retention_setting' if attributes.key?(:'isOverrideGlobalRetentionSetting') && attributes.key?(:'is_override_global_retention_setting')

      self.is_override_global_retention_setting = attributes[:'is_override_global_retention_setting'] unless attributes[:'is_override_global_retention_setting'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        target_id == other.target_id &&
        description == other.description &&
        audit_trails == other.audit_trails &&
        is_paid_usage_enabled == other.is_paid_usage_enabled &&
        online_months == other.online_months &&
        offline_months == other.offline_months &&
        audit_collected_volume == other.audit_collected_volume &&
        is_override_global_retention_setting == other.is_override_global_retention_setting &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, compartment_id, display_name, time_created, time_updated, lifecycle_state, lifecycle_details, target_id, description, audit_trails, is_paid_usage_enabled, online_months, offline_months, audit_collected_volume, is_override_global_retention_setting, freeform_tags, defined_tags, system_tags].hash
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
