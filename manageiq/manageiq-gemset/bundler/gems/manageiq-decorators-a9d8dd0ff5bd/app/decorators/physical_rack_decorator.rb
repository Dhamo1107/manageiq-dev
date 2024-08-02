class PhysicalRackDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-enterprise'
  end

  def quadicon
    {
      :fonticon => fonticon,
    }
  end
end
