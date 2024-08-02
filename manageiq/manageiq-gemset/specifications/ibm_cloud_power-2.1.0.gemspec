# -*- encoding: utf-8 -*-
# stub: ibm_cloud_power 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ibm_cloud_power".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["IBM Cloud Developers".freeze]
  s.date = "2022-11-28"
  s.description = "Ruby gem for IBM Cloud Power Cloud".freeze
  s.email = ["kylej@us.ibm.com".freeze]
  s.homepage = "https://openapi-generator.tech".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "IBM Cloud Power Cloud".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6", ">= 3.6.0"])
  else
    s.add_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6", ">= 3.6.0"])
  end
end
