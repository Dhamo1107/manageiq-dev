class AvailabilityZoneDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-zone'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
