class CloudObjectStoreContainerDecorator < MiqDecorator
  def self.fonticon
    'ff ff-cloud-object-store'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
