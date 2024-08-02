class EmsClusterDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-cluster'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
