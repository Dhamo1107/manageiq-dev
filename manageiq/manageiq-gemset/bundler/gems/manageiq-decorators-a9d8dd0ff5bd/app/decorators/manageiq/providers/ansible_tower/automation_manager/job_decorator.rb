module ManageIQ::Providers::AnsibleTower
  class AutomationManager::JobDecorator < MiqDecorator
    def self.fonticon
      'ff ff-stack'
    end

    def quadicon
      {
        :fonticon => fonticon
      }
    end
  end
end
