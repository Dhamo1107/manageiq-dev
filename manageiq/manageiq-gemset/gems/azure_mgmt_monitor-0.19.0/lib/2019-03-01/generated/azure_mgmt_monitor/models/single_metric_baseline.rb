# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2019_03_01
  module Models
    #
    # The baseline results of a single metric.
    #
    class SingleMetricBaseline

      include MsRestAzure

      # @return [String] The metric baseline Id.
      attr_accessor :id

      # @return [String] The resource type of the metric baseline resource.
      attr_accessor :type

      # @return [String] The name of the metric for which the baselines were
      # retrieved.
      attr_accessor :name

      # @return [String] The timespan for which the data was retrieved. Its
      # value consists of two datetimes concatenated, separated by '/'.  This
      # may be adjusted in the future and returned back from what was
      # originally requested.
      attr_accessor :timespan

      # @return [Duration] The interval (window size) for which the metric data
      # was returned in.  This may be adjusted in the future and returned back
      # from what was originally requested.  This is not present if a metadata
      # request was made.
      attr_accessor :interval

      # @return [String] The namespace of the metrics been queried.
      attr_accessor :namespace

      # @return [Array<TimeSeriesBaseline>] The baseline for each time series
      # that was queried.
      attr_accessor :baselines


      #
      # Mapper for SingleMetricBaseline class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SingleMetricBaseline',
          type: {
            name: 'Composite',
            class_name: 'SingleMetricBaseline',
            model_properties: {
              id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              timespan: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.timespan',
                type: {
                  name: 'String'
                }
              },
              interval: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.interval',
                type: {
                  name: 'TimeSpan'
                }
              },
              namespace: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.namespace',
                type: {
                  name: 'String'
                }
              },
              baselines: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.baselines',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'TimeSeriesBaselineElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'TimeSeriesBaseline'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
