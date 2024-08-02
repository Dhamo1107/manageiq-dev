# -*- encoding: utf-8 -*-
# stub: intersight_client 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "intersight_client".freeze
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["XLAB".freeze]
  s.date = "2022-07-25"
  s.description = "Gem for interaction with Cisco Intersight API".freeze
  s.homepage = "https://github.com/xlab-si/intersight-sdk-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Cisco Intersight Ruby Gem".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6", ">= 3.6.0"])
  else
    s.add_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6", ">= 3.6.0"])
  end
end
