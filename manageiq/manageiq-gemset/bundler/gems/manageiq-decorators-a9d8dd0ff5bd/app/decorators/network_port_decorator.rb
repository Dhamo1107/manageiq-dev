class NetworkPortDecorator < MiqDecorator
  def self.fonticon
    'ff ff-network-port'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
