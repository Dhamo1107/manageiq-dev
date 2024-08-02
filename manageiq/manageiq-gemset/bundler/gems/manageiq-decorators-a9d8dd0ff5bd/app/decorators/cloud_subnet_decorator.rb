class CloudSubnetDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-network'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
