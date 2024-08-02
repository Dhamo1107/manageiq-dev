# -*- encoding: utf-8 -*-
# stub: activerecord-virtual_attributes 6.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "activerecord-virtual_attributes".freeze
  s.version = "6.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/ManageIQ/activerecord-virtual_attributes/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/ManageIQ/activerecord-virtual_attributes", "source_code_uri" => "https://github.com/ManageIQ/activerecord-virtual_attributes" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Keenan Brock".freeze]
  s.date = "2022-08-09"
  s.description = "Define attributes in arel".freeze
  s.email = ["keenan@thebrocks.net".freeze]
  s.homepage = "https://github.com/ManageIQ/activerecord-virtual_attributes".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Access non-sql attributes from sql".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, ["~> 6.1.0"])
    s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_development_dependency(%q<db-query-matchers>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<activerecord>.freeze, ["~> 6.1.0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<db-query-matchers>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
