# -*- encoding: utf-8 -*-
# stub: wim_parser 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "wim_parser".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/ManageIQ/wim_parser", "source_code_uri" => "https://github.com/ManageIQ/wim_parser" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-02-03"
  s.description = "Parser for the Windows Image Format (WIM)".freeze
  s.homepage = "https://github.com/ManageIQ/wim_parser".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Parser for the Windows Image Format (WIM)".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<binary_struct>.freeze, ["~> 2.1"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<binary_struct>.freeze, ["~> 2.1"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.10"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
