# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DashboardService
    # Module containing models for requests made to, and responses received from,
    # OCI DashboardService services
    module Models
    end
  end
end

# Require models
require 'oci/dashboard_service/models/create_dashboard_details'
require 'oci/dashboard_service/models/create_dashboard_group_details'
require 'oci/dashboard_service/models/create_v1_dashboard_details'
require 'oci/dashboard_service/models/dashboard'
require 'oci/dashboard_service/models/dashboard_collection'
require 'oci/dashboard_service/models/dashboard_group'
require 'oci/dashboard_service/models/dashboard_group_collection'
require 'oci/dashboard_service/models/dashboard_group_summary'
require 'oci/dashboard_service/models/dashboard_summary'
require 'oci/dashboard_service/models/sort_order'
require 'oci/dashboard_service/models/update_dashboard_details'
require 'oci/dashboard_service/models/update_dashboard_group_details'
require 'oci/dashboard_service/models/update_v1_dashboard_details'
require 'oci/dashboard_service/models/v1_dashboard'

# Require generated clients
require 'oci/dashboard_service/dashboard_client'
require 'oci/dashboard_service/dashboard_client_composite_operations'
require 'oci/dashboard_service/dashboard_group_client'
require 'oci/dashboard_service/dashboard_group_client_composite_operations'

# Require service utilities
require 'oci/dashboard_service/util'
