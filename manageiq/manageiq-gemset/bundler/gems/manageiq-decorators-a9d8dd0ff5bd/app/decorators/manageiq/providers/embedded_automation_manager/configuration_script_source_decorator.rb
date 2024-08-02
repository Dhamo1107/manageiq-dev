module ManageIQ::Providers
  class EmbeddedAutomationManager::ConfigurationScriptSourceDecorator < MiqDecorator
    def self.fonticon
      "pficon pficon-repository"
    end

    def quadicon
      {
        :fonticon => fonticon
      }
    end
  end
end
