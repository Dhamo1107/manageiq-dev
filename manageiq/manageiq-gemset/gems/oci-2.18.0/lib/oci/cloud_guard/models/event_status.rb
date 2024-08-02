# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CloudGuard::Models
    EVENT_STATUS_ENUM = [
      EVENT_STATUS_REOPEN = 'REOPEN'.freeze,
      EVENT_STATUS_OPEN = 'OPEN'.freeze,
      EVENT_STATUS_UPDATE = 'UPDATE'.freeze,
      EVENT_STATUS_RESOLVE = 'RESOLVE'.freeze,
      EVENT_STATUS_DISMISS = 'DISMISS'.freeze,
      EVENT_STATUS_DELETE = 'DELETE'.freeze
    ].freeze
  end
end
