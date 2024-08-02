class ConfiguredSystemDecorator < MiqDecorator
  def self.fonticon
    'ff ff-configured-system'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
