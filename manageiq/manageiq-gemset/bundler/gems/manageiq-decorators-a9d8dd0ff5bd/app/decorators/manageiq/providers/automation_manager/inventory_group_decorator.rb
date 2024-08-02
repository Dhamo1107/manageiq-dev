module ManageIQ::Providers
  class AutomationManager::InventoryGroupDecorator < MiqDecorator
    def self.fonticon
      'pficon pficon-folder-close'
    end

    def quadicon
      {
        :fonticon => fonticon
      }
    end
  end
end
