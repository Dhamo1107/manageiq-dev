class CloudTenantDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-cloud-tenant'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
