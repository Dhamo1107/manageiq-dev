class FloatingIpDecorator < MiqDecorator
  def self.fonticon
    'ff ff-floating-ip'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
