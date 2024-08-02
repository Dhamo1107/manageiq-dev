class ContainerBuildDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-build'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
