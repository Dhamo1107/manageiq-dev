module ManageIQ::Providers::AnsibleTower
  class AutomationManager::ConfigurationScriptDecorator < MiqDecorator
    def self.fonticon
      'pficon pficon-template'
    end

    def quadicon
      {
        :fonticon => fonticon
      }
    end
  end
end
