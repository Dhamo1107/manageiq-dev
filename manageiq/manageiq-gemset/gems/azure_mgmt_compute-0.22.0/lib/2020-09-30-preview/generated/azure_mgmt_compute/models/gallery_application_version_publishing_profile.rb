# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_09_30_preview
  module Models
    #
    # The publishing profile of a gallery image version.
    #
    class GalleryApplicationVersionPublishingProfile < GalleryArtifactPublishingProfileBase

      include MsRestAzure

      # @return [UserArtifactSource]
      attr_accessor :source

      # @return [UserArtifactManage]
      attr_accessor :manage_actions

      # @return [Boolean] Optional. Whether or not this application reports
      # health.
      attr_accessor :enable_health_check


      #
      # Mapper for GalleryApplicationVersionPublishingProfile class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'GalleryApplicationVersionPublishingProfile',
          type: {
            name: 'Composite',
            class_name: 'GalleryApplicationVersionPublishingProfile',
            model_properties: {
              target_regions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'targetRegions',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'TargetRegionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'TargetRegion'
                      }
                  }
                }
              },
              replica_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'replicaCount',
                type: {
                  name: 'Number'
                }
              },
              exclude_from_latest: {
                client_side_validation: true,
                required: false,
                serialized_name: 'excludeFromLatest',
                type: {
                  name: 'Boolean'
                }
              },
              published_date: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'publishedDate',
                type: {
                  name: 'DateTime'
                }
              },
              end_of_life_date: {
                client_side_validation: true,
                required: false,
                serialized_name: 'endOfLifeDate',
                type: {
                  name: 'DateTime'
                }
              },
              storage_account_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'storageAccountType',
                type: {
                  name: 'String'
                }
              },
              source: {
                client_side_validation: true,
                required: true,
                serialized_name: 'source',
                type: {
                  name: 'Composite',
                  class_name: 'UserArtifactSource'
                }
              },
              manage_actions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'manageActions',
                type: {
                  name: 'Composite',
                  class_name: 'UserArtifactManage'
                }
              },
              enable_health_check: {
                client_side_validation: true,
                required: false,
                serialized_name: 'enableHealthCheck',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
