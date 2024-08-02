# -*- encoding: utf-8 -*-
# stub: mime-types 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mime-types".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick LaMuro".freeze]
  s.date = "2017-03-27"
  s.description = "Stub mime-types repo that redirects to mini-mime".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Stub mime-types repo that redirects to mini-mime".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<mini_mime>.freeze, [">= 0.1.1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
  else
    s.add_dependency(%q<mini_mime>.freeze, [">= 0.1.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
  end
end
