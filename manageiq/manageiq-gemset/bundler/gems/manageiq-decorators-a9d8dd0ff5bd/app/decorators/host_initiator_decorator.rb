class HostInitiatorDecorator < MiqDecorator
def self.fonticon
    'pficon pficon-virtual-machine'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
