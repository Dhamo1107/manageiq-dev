class ResourcePoolDecorator < MiqDecorator
  def self.fonticon
    'pficon pficon-resource-pool'
  end

  def fileicon
    vapp ? 'svg/vendor-vmware.svg' : nil
  end

  def quadicon
    {
      :fileicon => fileicon,
      :fonticon => fileicon ? nil : fonticon
    }.compact
  end
end
