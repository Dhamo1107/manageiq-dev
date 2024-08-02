module ManageIQ::Providers
  class AutomationManager::InventoryRootGroupDecorator < MiqDecorator
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
