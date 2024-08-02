# -*- encoding: utf-8 -*-
# stub: foreman_api_client 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "foreman_api_client".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Keenan Brock".freeze, "Brandon Dunne".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-09-08"
  s.description = "Foreman apipie-bindings wrapper".freeze
  s.email = ["keenan@thebrocks.net".freeze, "bdunne@redhat.com".freeze]
  s.homepage = "https://github.com/ManageIQ/foreman_api_client".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Foreman apipie-bindings wrapper".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<apipie-bindings>.freeze, ["= 0.4.0"])
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0.2"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 2.3.1"])
  else
    s.add_dependency(%q<apipie-bindings>.freeze, ["= 0.4.0"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0.2"])
    s.add_dependency(%q<webmock>.freeze, ["~> 2.3.1"])
  end
end
