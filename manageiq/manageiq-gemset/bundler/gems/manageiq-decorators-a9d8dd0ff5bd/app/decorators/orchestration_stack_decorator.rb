class OrchestrationStackDecorator < MiqDecorator
  def self.fonticon
    'ff ff-stack'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
