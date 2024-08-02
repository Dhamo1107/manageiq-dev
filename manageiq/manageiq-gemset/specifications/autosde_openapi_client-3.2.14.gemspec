# -*- encoding: utf-8 -*-
# stub: autosde_openapi_client 3.2.14 ruby lib

Gem::Specification.new do |s|
  s.name = "autosde_openapi_client".freeze
  s.version = "3.2.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["OpenAPI-Generator".freeze]
  s.date = "2023-04-24"
  s.description = "Site Manager API".freeze
  s.email = ["autosde@il.ibm.com".freeze]
  s.homepage = "https://github.com/Autosde/autosde-oas/tree/main/generated".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Site Manager API Ruby Gem".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.6.0", "~> 3.6"])
  else
    s.add_dependency(%q<typhoeus>.freeze, ["~> 1.0", ">= 1.0.1"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.6.0", "~> 3.6"])
  end
end
