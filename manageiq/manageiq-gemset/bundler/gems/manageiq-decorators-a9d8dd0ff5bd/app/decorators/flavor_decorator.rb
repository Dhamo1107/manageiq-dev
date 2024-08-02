class FlavorDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-flavor'
  end

  def quadicon
    {
      :fonticon => fonticon
    }
  end
end
