# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Devops::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_PROJECT = 'CREATE_PROJECT'.freeze,
      OPERATION_TYPE_UPDATE_PROJECT = 'UPDATE_PROJECT'.freeze,
      OPERATION_TYPE_DELETE_PROJECT = 'DELETE_PROJECT'.freeze,
      OPERATION_TYPE_MOVE_PROJECT = 'MOVE_PROJECT'.freeze,
      OPERATION_TYPE_CREATE_DEPLOY_PIPELINE = 'CREATE_DEPLOY_PIPELINE'.freeze,
      OPERATION_TYPE_UPDATE_DEPLOY_PIPELINE = 'UPDATE_DEPLOY_PIPELINE'.freeze,
      OPERATION_TYPE_DELETE_DEPLOY_PIPELINE = 'DELETE_DEPLOY_PIPELINE'.freeze,
      OPERATION_TYPE_CREATE_DEPLOY_STAGE = 'CREATE_DEPLOY_STAGE'.freeze,
      OPERATION_TYPE_UPDATE_DEPLOY_STAGE = 'UPDATE_DEPLOY_STAGE'.freeze,
      OPERATION_TYPE_DELETE_DEPLOY_STAGE = 'DELETE_DEPLOY_STAGE'.freeze,
      OPERATION_TYPE_CREATE_DEPLOY_ARTIFACT = 'CREATE_DEPLOY_ARTIFACT'.freeze,
      OPERATION_TYPE_UPDATE_DEPLOY_ARTIFACT = 'UPDATE_DEPLOY_ARTIFACT'.freeze,
      OPERATION_TYPE_DELETE_DEPLOY_ARTIFACT = 'DELETE_DEPLOY_ARTIFACT'.freeze,
      OPERATION_TYPE_CREATE_DEPLOY_ENVIRONMENT = 'CREATE_DEPLOY_ENVIRONMENT'.freeze,
      OPERATION_TYPE_UPDATE_DEPLOY_ENVIRONMENT = 'UPDATE_DEPLOY_ENVIRONMENT'.freeze,
      OPERATION_TYPE_DELETE_DEPLOY_ENVIRONMENT = 'DELETE_DEPLOY_ENVIRONMENT'.freeze,
      OPERATION_TYPE_CREATE_DEPLOYMENT = 'CREATE_DEPLOYMENT'.freeze,
      OPERATION_TYPE_UPDATE_DEPLOYMENT = 'UPDATE_DEPLOYMENT'.freeze,
      OPERATION_TYPE_DELETE_DEPLOYMENT = 'DELETE_DEPLOYMENT'.freeze,
      OPERATION_TYPE_CREATE_BUILD_PIPELINE = 'CREATE_BUILD_PIPELINE'.freeze,
      OPERATION_TYPE_UPDATE_BUILD_PIPELINE = 'UPDATE_BUILD_PIPELINE'.freeze,
      OPERATION_TYPE_DELETE_BUILD_PIPELINE = 'DELETE_BUILD_PIPELINE'.freeze,
      OPERATION_TYPE_CREATE_BUILD_PIPELINE_STAGE = 'CREATE_BUILD_PIPELINE_STAGE'.freeze,
      OPERATION_TYPE_UPDATE_BUILD_PIPELINE_STAGE = 'UPDATE_BUILD_PIPELINE_STAGE'.freeze,
      OPERATION_TYPE_DELETE_BUILD_PIPELINE_STAGE = 'DELETE_BUILD_PIPELINE_STAGE'.freeze,
      OPERATION_TYPE_CREATE_CONNECTION = 'CREATE_CONNECTION'.freeze,
      OPERATION_TYPE_UPDATE_CONNECTION = 'UPDATE_CONNECTION'.freeze,
      OPERATION_TYPE_DELETE_CONNECTION = 'DELETE_CONNECTION'.freeze,
      OPERATION_TYPE_CREATE_TRIGGER = 'CREATE_TRIGGER'.freeze,
      OPERATION_TYPE_UPDATE_TRIGGER = 'UPDATE_TRIGGER'.freeze,
      OPERATION_TYPE_DELETE_TRIGGER = 'DELETE_TRIGGER'.freeze,
      OPERATION_TYPE_EXECUTE_TRIGGER = 'EXECUTE_TRIGGER'.freeze,
      OPERATION_TYPE_CREATE_REPOSITORY = 'CREATE_REPOSITORY'.freeze,
      OPERATION_TYPE_UPDATE_REPOSITORY = 'UPDATE_REPOSITORY'.freeze,
      OPERATION_TYPE_DELETE_REPOSITORY = 'DELETE_REPOSITORY'.freeze,
      OPERATION_TYPE_MIRROR_REPOSITORY = 'MIRROR_REPOSITORY'.freeze
    ].freeze
  end
end
