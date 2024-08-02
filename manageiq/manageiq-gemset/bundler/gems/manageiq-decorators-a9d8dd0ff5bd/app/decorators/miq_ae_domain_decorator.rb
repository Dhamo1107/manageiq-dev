class MiqAeDomainDecorator < MiqDecorator
  def self.fonticon
    'fa fa-globe'
  end

  def fonticon
    name == MiqAeDatastore::MANAGEIQ_DOMAIN ? 'ff ff-manageiq' : super
  end

  def fileicon
    if git_enabled?
      'svg/ae_git_domain.svg'
    elsif top_level_namespace
      "svg/vendor-#{top_level_namespace.downcase}.svg"
    end
  end
end
