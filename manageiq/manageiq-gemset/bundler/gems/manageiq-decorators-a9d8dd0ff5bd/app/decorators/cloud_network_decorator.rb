class CloudNetworkDecorator < MiqDecorator
  def self.fonticon
    'ff ff-cloud-network'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
