class PhysicalStorageDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-container-node'
  end

  def quadicon
    {
      :fonticon => fonticon,
      :tooltip  => ui_lookup(:model => type),
    }
  end
end
