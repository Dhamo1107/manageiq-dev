# -*- encoding: utf-8 -*-
# stub: more_core_extensions 4.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "more_core_extensions".freeze
  s.version = "4.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Frey".freeze, "Brandon Dunne".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-03-01"
  s.description = "MoreCoreExtensions are a set of core extensions beyond those provided by ActiveSupport.".freeze
  s.email = ["fryguy9@gmail.com".freeze, "bdunne@redhat.com".freeze]
  s.homepage = "http://github.com/ManageIQ/more_core_extensions".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "MoreCoreExtensions are a set of core extensions beyond those provided by ActiveSupport.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sync>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<sync>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_dependency(%q<timecop>.freeze, [">= 0"])
  end
end
