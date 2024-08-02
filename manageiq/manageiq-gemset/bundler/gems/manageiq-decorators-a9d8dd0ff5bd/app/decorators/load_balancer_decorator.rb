class LoadBalancerDecorator < MiqDecorator
  def self.fonticon
    'ff ff-load-balancer'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
