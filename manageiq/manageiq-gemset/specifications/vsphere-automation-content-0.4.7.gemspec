# -*- encoding: utf-8 -*-
# stub: vsphere-automation-content 0.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "vsphere-automation-content".freeze
  s.version = "0.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["J.R. Garcia".freeze]
  s.date = "2020-07-14"
  s.description = "A Ruby SDK for the vSphere APIs (Content)".freeze
  s.email = ["jrg@vmware.com".freeze]
  s.homepage = "https://github.com/vmware/vsphere-automation-sdk-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A Ruby SDK for the vSphere APIs (Content)".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<vsphere-automation-runtime>.freeze, ["~> 0.4.6"])
    s.add_runtime_dependency(%q<vsphere-automation-cis>.freeze, ["~> 0.4.6"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.12.2"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.73.0"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.6"])
  else
    s.add_dependency(%q<vsphere-automation-runtime>.freeze, ["~> 0.4.6"])
    s.add_dependency(%q<vsphere-automation-cis>.freeze, ["~> 0.4.6"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.12.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.73.0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 5.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.6"])
  end
end
