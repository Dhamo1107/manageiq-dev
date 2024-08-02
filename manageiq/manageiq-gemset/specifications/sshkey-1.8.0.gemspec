# -*- encoding: utf-8 -*-
# stub: sshkey 1.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sshkey".freeze
  s.version = "1.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Miller".freeze]
  s.date = "2015-12-01"
  s.description = "Generate private/public SSH keypairs using pure Ruby".freeze
  s.email = ["bensie@gmail.com".freeze]
  s.homepage = "https://github.com/bensie/sshkey".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "SSH private/public key generator in Ruby".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
