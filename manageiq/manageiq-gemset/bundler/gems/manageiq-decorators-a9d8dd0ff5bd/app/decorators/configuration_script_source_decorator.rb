class ConfigurationScriptSourceDecorator < MiqDecorator
  def self.fonticon
    "pficon pficon-repository"
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
