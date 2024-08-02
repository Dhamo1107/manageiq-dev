class HostInitiatorGroupDecorator < MiqDecorator
  def self.fonticon
    'ff ff-relationship'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
