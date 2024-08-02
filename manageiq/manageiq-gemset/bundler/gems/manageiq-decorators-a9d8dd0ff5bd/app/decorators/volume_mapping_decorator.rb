class VolumeMappingDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-topology'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
