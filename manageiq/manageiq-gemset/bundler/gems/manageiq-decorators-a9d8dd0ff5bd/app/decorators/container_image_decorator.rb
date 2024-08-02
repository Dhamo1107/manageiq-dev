class ContainerImageDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-image'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
