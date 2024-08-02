# -*- encoding: utf-8 -*-
# stub: jquery-rjs 0.1.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-rjs".freeze
  s.version = "0.1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aaron Eisenberger".freeze]
  s.date = "2022-09-20"
  s.email = "aaronchi@gmail.com".freeze
  s.homepage = "http://github.com/aaronchi/jquery-rjs".freeze
  s.rubygems_version = "3.2.33".freeze
  s.summary = "jQuery and RJS for Ruby on Rails".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3.2"])
    s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.2"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
  end
end
