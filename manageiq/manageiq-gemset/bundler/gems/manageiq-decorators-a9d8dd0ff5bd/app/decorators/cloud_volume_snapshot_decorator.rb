class CloudVolumeSnapshotDecorator < MiqDecorator
  def self.fonticon
    'fa fa-camera'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
