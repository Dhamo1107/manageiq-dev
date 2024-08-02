class HostAggregateDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-container-node'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
