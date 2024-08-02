# -*- encoding: utf-8 -*-
# stub: fog-vcloud-director 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-vcloud-director".freeze
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Luka Zakraj\u0161ek".freeze]
  s.date = "2021-05-11"
  s.description = "This library can be used as a module for `fog` or as standalone provider\n                        to use the vCloud Director in applications.".freeze
  s.email = ["luka@bancek.net".freeze]
  s.homepage = "https://github.com/xlab-si/fog-vcloud-director".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Module for the 'fog' gem to support vCloud Director.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-core>.freeze, [">= 1.40"])
    s.add_runtime_dependency(%q<fog-xml>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.52.1"])
    s.add_development_dependency(%q<pronto-rubocop>.freeze, [">= 0"])
  else
    s.add_dependency(%q<fog-core>.freeze, [">= 1.40"])
    s.add_dependency(%q<fog-xml>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.52.1"])
    s.add_dependency(%q<pronto-rubocop>.freeze, [">= 0"])
  end
end
