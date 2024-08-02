# -*- encoding: utf-8 -*-
# stub: manageiq-api-client 0.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-api-client".freeze
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alberto Bellotti".freeze, "Jason Frey".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-05-19"
  s.description = "\n    This gem provides Ruby access to the ManageIQ API by exposing the ManageIQ\n    collections, resources and related actions as Ruby objects and equivalent methods.\n  ".freeze
  s.email = ["abellott@redhat.com".freeze, "jfrey@redhat.com".freeze]
  s.homepage = "http://github.com/ManageIQ/manageiq-api-client".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ API Client".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_runtime_dependency(%q<faraday>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2.3"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<query_relation>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.0", "< 7.0"])
    s.add_dependency(%q<faraday>.freeze, ["~> 1.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 1.0"])
    s.add_dependency(%q<json>.freeze, ["~> 2.3"])
    s.add_dependency(%q<more_core_extensions>.freeze, [">= 0"])
    s.add_dependency(%q<query_relation>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
