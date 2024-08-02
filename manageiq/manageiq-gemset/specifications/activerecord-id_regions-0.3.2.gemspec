# -*- encoding: utf-8 -*-
# stub: activerecord-id_regions 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "activerecord-id_regions".freeze
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-02-02"
  s.description = "ActiveRecord extension to allow partitioning ids into regions, for merge replication purposes".freeze
  s.homepage = "https://github.com/ManageIQ/activerecord-id_regions".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ActiveRecord extension to allow partitioning ids into regions, for merge replication purposes".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 5.0", "< 7.0"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_runtime_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 5.0", "< 7.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
