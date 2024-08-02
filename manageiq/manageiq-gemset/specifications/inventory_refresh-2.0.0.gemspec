# -*- encoding: utf-8 -*-
# stub: inventory_refresh 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "inventory_refresh".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-09-06"
  s.description = "Topological Inventory Persister".freeze
  s.homepage = "https://github.com/ManageIQ/inventory_refresh".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Topological Inventory Persister".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 5.0", "< 7.0"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, [">= 3.5", "< 5"])
    s.add_runtime_dependency(%q<pg>.freeze, ["> 0"])
    s.add_development_dependency(%q<ancestry>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<factory_bot>.freeze, ["~> 4.11.1"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 5.0", "< 7.0"])
    s.add_dependency(%q<more_core_extensions>.freeze, [">= 3.5", "< 5"])
    s.add_dependency(%q<pg>.freeze, ["> 0"])
    s.add_dependency(%q<ancestry>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<factory_bot>.freeze, ["~> 4.11.1"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
