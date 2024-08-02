class ContainerDecorator < MiqDecorator
  def self.fonticon
    'fa fa-cube'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
