class ContainerGroupDecorator < MiqDecorator
  def self.fonticon
    'fa fa-cubes'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
