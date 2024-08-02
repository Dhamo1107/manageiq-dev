class ServiceTemplateCatalogDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-folder-close'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
