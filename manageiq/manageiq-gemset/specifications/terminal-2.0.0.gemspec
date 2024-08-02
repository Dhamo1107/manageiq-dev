# -*- encoding: utf-8 -*-
# stub: terminal 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "terminal".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Keith Pitt".freeze]
  s.date = "2015-02-23"
  s.description = "Converts ANSI to HTML".freeze
  s.email = ["me@keithpitt.com".freeze]
  s.executables = ["terminal".freeze]
  s.files = ["bin/terminal".freeze]
  s.homepage = "https://github.com/buildkite/terminal".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Converts ANSI to HTML".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<escape_utils>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_development_dependency(%q<method_profiler>.freeze, [">= 0"])
    s.add_development_dependency(%q<memory_profiler>.freeze, [">= 0"])
  else
    s.add_dependency(%q<escape_utils>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_dependency(%q<method_profiler>.freeze, [">= 0"])
    s.add_dependency(%q<memory_profiler>.freeze, [">= 0"])
  end
end
