class AuthenticationDecorator < MiqDecorator
  def self.fonticon
    'ff ff-cloud-keys'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
