class StorageServiceDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-services'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
