class ContainerReplicatorDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-replicator'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
