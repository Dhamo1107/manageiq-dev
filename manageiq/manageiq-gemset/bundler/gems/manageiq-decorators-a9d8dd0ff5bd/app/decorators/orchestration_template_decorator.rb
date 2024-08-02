class OrchestrationTemplateDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-template'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
