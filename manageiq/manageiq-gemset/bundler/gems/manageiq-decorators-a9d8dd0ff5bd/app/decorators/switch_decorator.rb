class SwitchDecorator < MiqDecorator
  def self.fonticon
    'ff ff-network-switch'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
