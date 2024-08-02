# -*- encoding: utf-8 -*-
# stub: ruby-dbus 0.22.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-dbus".freeze
  s.version = "0.22.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruby DBus Team".freeze]
  s.date = "2023-05-17"
  s.description = "Pure Ruby module for interaction with D-Bus IPC system".freeze
  s.email = "martin.github@vidner.net".freeze
  s.homepage = "https://github.com/mvidner/ruby-dbus".freeze
  s.licenses = ["LGPL-2.1".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby module for interaction with D-Bus".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rexml>.freeze, [">= 0"])
    s.add_development_dependency(%q<packaging_rake_tasks>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<rubocop>.freeze, ["= 1.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov-lcov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rexml>.freeze, [">= 0"])
    s.add_dependency(%q<packaging_rake_tasks>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rubocop>.freeze, ["= 1.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-lcov>.freeze, [">= 0"])
  end
end
