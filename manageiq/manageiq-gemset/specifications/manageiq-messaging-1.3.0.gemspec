# -*- encoding: utf-8 -*-
# stub: manageiq-messaging 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-messaging".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ManageIQ/manageiq-messaging/issues", "changelog_uri" => "https://github.com/ManageIQ/manageiq-messaging/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/ManageIQ/manageiq-messaging/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-04-03"
  s.description = "Client library for ManageIQ components to exchange messages through its internal message bus.".freeze
  s.homepage = "https://github.com/ManageIQ/manageiq-messaging".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Client library for ManageIQ components to exchange messages through its internal message bus.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.2.4.3", "< 7.0"])
    s.add_runtime_dependency(%q<rdkafka>.freeze, ["~> 0.8"])
    s.add_runtime_dependency(%q<stomp>.freeze, ["~> 1.4.4"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.2.4.3", "< 7.0"])
    s.add_dependency(%q<rdkafka>.freeze, ["~> 0.8"])
    s.add_dependency(%q<stomp>.freeze, ["~> 1.4.4"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
