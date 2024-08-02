# -*- encoding: utf-8 -*-
# stub: floe 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "floe".freeze
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/ManageIQ/floe/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/ManageIQ/floe", "source_code_uri" => "https://github.com/ManageIQ/floe" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-07-28"
  s.description = "Simple Workflow Runner.".freeze
  s.executables = ["floe".freeze]
  s.files = ["exe/floe".freeze]
  s.homepage = "https://github.com/ManageIQ/floe".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Simple Workflow Runner.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<awesome_spawn>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<jsonpath>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<kubeclient>.freeze, ["~> 4.7"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  else
    s.add_dependency(%q<awesome_spawn>.freeze, ["~> 1.0"])
    s.add_dependency(%q<jsonpath>.freeze, ["~> 1.1"])
    s.add_dependency(%q<kubeclient>.freeze, ["~> 4.7"])
    s.add_dependency(%q<more_core_extensions>.freeze, [">= 0"])
    s.add_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
  end
end
