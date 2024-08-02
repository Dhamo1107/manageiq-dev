# -*- encoding: utf-8 -*-
# stub: manageiq-smartstate 0.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-smartstate".freeze
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-11-03"
  s.description = "ManageIQ SmartState Analysis".freeze
  s.homepage = "https://github.com/ManageIQ/manageiq-smartstate".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ SmartState Analysis".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<awesome_spawn>.freeze, ["~> 1.5"])
    s.add_runtime_dependency(%q<azure-armrest>.freeze, ["~> 0.9"])
    s.add_runtime_dependency(%q<binary_struct>.freeze, ["~> 2.1"])
    s.add_runtime_dependency(%q<iniparse>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<linux_block_device>.freeze, ["~> 0.2.1"])
    s.add_runtime_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_runtime_dependency(%q<memory_buffer>.freeze, [">= 0.1.0"])
    s.add_runtime_dependency(%q<rufus-lru>.freeze, ["~> 1.0.3"])
    s.add_runtime_dependency(%q<sys-uname>.freeze, ["~> 1.2.1"])
    s.add_runtime_dependency(%q<uuidtools>.freeze, ["~> 2.1"])
    s.add_runtime_dependency(%q<vmware_web_service>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<camcorder>.freeze, [">= 0"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0.2"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 2.3.1"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<awesome_spawn>.freeze, ["~> 1.5"])
    s.add_dependency(%q<azure-armrest>.freeze, ["~> 0.9"])
    s.add_dependency(%q<binary_struct>.freeze, ["~> 2.1"])
    s.add_dependency(%q<iniparse>.freeze, [">= 0"])
    s.add_dependency(%q<linux_block_device>.freeze, ["~> 0.2.1"])
    s.add_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_dependency(%q<memory_buffer>.freeze, [">= 0.1.0"])
    s.add_dependency(%q<rufus-lru>.freeze, ["~> 1.0.3"])
    s.add_dependency(%q<sys-uname>.freeze, ["~> 1.2.1"])
    s.add_dependency(%q<uuidtools>.freeze, ["~> 2.1"])
    s.add_dependency(%q<vmware_web_service>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<camcorder>.freeze, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0.2"])
    s.add_dependency(%q<webmock>.freeze, ["~> 2.3.1"])
  end
end
