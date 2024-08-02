# -*- encoding: utf-8 -*-
# stub: manageiq-postgres_ha_admin 3.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-postgres_ha_admin".freeze
  s.version = "3.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ManageIQ/manageiq-postgres_ha_admin/issues", "changelog_uri" => "https://github.com/ManageIQ/manageiq-postgres_ha_admin/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/ManageIQ/manageiq-postgres_ha_admin/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.date = "2023-03-22"
  s.description = "ManageIQ Postgres H.A. Admin".freeze
  s.homepage = "https://github.com/ManageIQ/manageiq-postgres_ha_admin".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.8".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ Postgres H.A. Admin".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_runtime_dependency(%q<awesome_spawn>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_runtime_dependency(%q<pg>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<pg-dsn_parser>.freeze, ["~> 0.1"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_dependency(%q<awesome_spawn>.freeze, ["~> 1.4"])
    s.add_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<pg-dsn_parser>.freeze, ["~> 0.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
