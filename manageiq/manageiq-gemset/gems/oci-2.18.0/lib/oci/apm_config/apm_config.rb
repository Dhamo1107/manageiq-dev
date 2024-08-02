# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApmConfig
    # Module containing models for requests made to, and responses received from,
    # OCI ApmConfig services
    module Models
    end
  end
end

# Require models
require 'oci/apm_config/models/apdex'
require 'oci/apm_config/models/apdex_rules'
require 'oci/apm_config/models/apdex_rules_summary'
require 'oci/apm_config/models/config'
require 'oci/apm_config/models/config_collection'
require 'oci/apm_config/models/config_summary'
require 'oci/apm_config/models/config_types'
require 'oci/apm_config/models/create_apdex_rules_details'
require 'oci/apm_config/models/create_config_details'
require 'oci/apm_config/models/create_metric_group_details'
require 'oci/apm_config/models/create_options_details'
require 'oci/apm_config/models/create_span_filter_details'
require 'oci/apm_config/models/dimension'
require 'oci/apm_config/models/metric'
require 'oci/apm_config/models/metric_group'
require 'oci/apm_config/models/metric_group_summary'
require 'oci/apm_config/models/metric_types'
require 'oci/apm_config/models/namespace'
require 'oci/apm_config/models/namespace_collection'
require 'oci/apm_config/models/namespace_metric'
require 'oci/apm_config/models/namespace_metric_collection'
require 'oci/apm_config/models/options'
require 'oci/apm_config/models/options_summary'
require 'oci/apm_config/models/retrieve_namespace_metrics_details'
require 'oci/apm_config/models/sort_orders'
require 'oci/apm_config/models/span_filter'
require 'oci/apm_config/models/span_filter_summary'
require 'oci/apm_config/models/update_apdex_rules_details'
require 'oci/apm_config/models/update_config_details'
require 'oci/apm_config/models/update_metric_group_details'
require 'oci/apm_config/models/update_options_details'
require 'oci/apm_config/models/update_span_filter_details'
require 'oci/apm_config/models/validate_span_filter_pattern_details'

# Require generated clients
require 'oci/apm_config/config_client'

# Require service utilities
require 'oci/apm_config/util'
