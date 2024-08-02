class PersistentVolumeDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-volume'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
