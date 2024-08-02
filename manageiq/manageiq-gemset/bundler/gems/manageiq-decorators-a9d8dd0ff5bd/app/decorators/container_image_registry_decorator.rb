class ContainerImageRegistryDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-registry'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
