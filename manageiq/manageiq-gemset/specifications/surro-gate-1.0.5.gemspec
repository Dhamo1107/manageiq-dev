# -*- encoding: utf-8 -*-
# stub: surro-gate 1.0.5 ruby lib
# stub: ext/surro-gate/extconf.rb

Gem::Specification.new do |s|
  s.name = "surro-gate".freeze
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["D\u00E1vid Hal\u00E1sz".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-03-18"
  s.description = "A generic purrpose TCP-to-TCP proxy for Ruby implemented using epoll".freeze
  s.email = ["skateman@skateman.eu".freeze]
  s.extensions = ["ext/surro-gate/extconf.rb".freeze]
  s.files = ["ext/surro-gate/extconf.rb".freeze]
  s.homepage = "https://github.com/skateman/surro-gate".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A generic purrpose TCP-to-TCP proxy in Ruby".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<concurrent-ruby>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<concurrent-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
