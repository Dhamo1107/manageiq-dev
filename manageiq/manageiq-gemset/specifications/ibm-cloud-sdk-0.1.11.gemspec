# -*- encoding: utf-8 -*-
# stub: ibm-cloud-sdk 0.1.11 ruby lib

Gem::Specification.new do |s|
  s.name = "ibm-cloud-sdk".freeze
  s.version = "0.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby/blob/v0.1.11/CHANGELOG.md", "homepage_uri" => "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["IBM Cloud Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-10-28"
  s.description = "A Ruby gem for interacting with the various IBM Cloud services.".freeze
  s.homepage = "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby".freeze
  s.licenses = ["\"Apache-2.0\"".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "IBM Cloud API Ruby gem.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<httparty>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<httparty>.freeze, [">= 0"])
  end
end
