# -*- encoding: utf-8 -*-
# stub: ibm_power_hmc 0.25.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ibm_power_hmc".freeze
  s.version = "0.25.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "http://github.com/IBM/ibm_power_hmc_sdk_ruby/blob/master/CHANGELOG.md", "homepage_uri" => "http://github.com/IBM/ibm_power_hmc_sdk_ruby", "source_code_uri" => "http://github.com/IBM/ibm_power_hmc_sdk_ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["IBM Power".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-11-29"
  s.description = "A Ruby gem for interacting with the IBM Hardware Management Console (HMC).".freeze
  s.homepage = "http://github.com/IBM/ibm_power_hmc_sdk_ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "IBM Power HMC Ruby gem.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<manageiq-style>.freeze, ["~> 1.3"])
  else
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.1"])
    s.add_dependency(%q<manageiq-style>.freeze, ["~> 1.3"])
  end
end
