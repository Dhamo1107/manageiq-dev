class ContainerServiceDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-service'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
