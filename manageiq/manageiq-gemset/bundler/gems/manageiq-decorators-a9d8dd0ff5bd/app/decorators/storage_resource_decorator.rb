class StorageResourceDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-resource-pool'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
