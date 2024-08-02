# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CertificatesManagement::Models
    SIGNATURE_ALGORITHM_ENUM = [
      SIGNATURE_ALGORITHM_SHA256_WITH_RSA = 'SHA256_WITH_RSA'.freeze,
      SIGNATURE_ALGORITHM_SHA384_WITH_RSA = 'SHA384_WITH_RSA'.freeze,
      SIGNATURE_ALGORITHM_SHA512_WITH_RSA = 'SHA512_WITH_RSA'.freeze,
      SIGNATURE_ALGORITHM_SHA256_WITH_ECDSA = 'SHA256_WITH_ECDSA'.freeze,
      SIGNATURE_ALGORITHM_SHA384_WITH_ECDSA = 'SHA384_WITH_ECDSA'.freeze,
      SIGNATURE_ALGORITHM_SHA512_WITH_ECDSA = 'SHA512_WITH_ECDSA'.freeze
    ].freeze
  end
end
