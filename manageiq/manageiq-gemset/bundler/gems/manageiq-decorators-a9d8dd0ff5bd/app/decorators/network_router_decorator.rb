class NetworkRouterDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-route'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
