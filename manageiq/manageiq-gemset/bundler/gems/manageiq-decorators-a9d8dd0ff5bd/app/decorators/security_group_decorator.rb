class SecurityGroupDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-cloud-security'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
