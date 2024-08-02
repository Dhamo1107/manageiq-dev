class ContainerProjectDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-project'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
