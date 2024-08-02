# -*- encoding: utf-8 -*-
# stub: azure-armrest 0.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "azure-armrest".freeze
  s.version = "0.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel J. Berger".freeze, "Bronagh Sorota".freeze, "Greg Blomquist".freeze, "Bill Wei".freeze]
  s.date = "2022-08-02"
  s.description = "This is a Ruby interface for Azure using the newer REST API. This is\ndifferent than the current azure gem, which uses the older (XML) interface\nbehind the scenes.\n".freeze
  s.email = ["dberger@redhat.com".freeze, "bsorota@redhat.com".freeze, "gblomqui@redhat.com".freeze, "billwei@redhat.com".freeze]
  s.homepage = "http://github.com/ManageIQ/azure-armrest".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "An interface for ARM/JSON Azure REST API".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2.2"])
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.8"])
    s.add_runtime_dependency(%q<azure-signature>.freeze, ["~> 0.3.0"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2"])
    s.add_runtime_dependency(%q<memoist>.freeze, ["~> 0.15"])
    s.add_runtime_dependency(%q<parallel>.freeze, ["~> 1.22"])
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.1.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.7"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 4.2.2"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.8"])
    s.add_dependency(%q<azure-signature>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<json>.freeze, ["~> 2"])
    s.add_dependency(%q<memoist>.freeze, ["~> 0.15"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.22"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.7"])
  end
end
