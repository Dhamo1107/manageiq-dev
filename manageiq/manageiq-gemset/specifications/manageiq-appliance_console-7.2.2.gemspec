# -*- encoding: utf-8 -*-
# stub: manageiq-appliance_console 7.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-appliance_console".freeze
  s.version = "7.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.date = "2023-06-30"
  s.description = "ManageIQ Appliance Console".freeze
  s.executables = ["appliance_console".freeze, "appliance_console_cli".freeze]
  s.files = ["bin/appliance_console".freeze, "bin/appliance_console_cli".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-appliance_console".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ Appliance Console".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, ["~> 6.1.6", ">= 6.1.6.1"])
    s.add_runtime_dependency(%q<activesupport>.freeze, ["~> 6.1.6", ">= 6.1.6.1"])
    s.add_runtime_dependency(%q<awesome_spawn>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<bcrypt>.freeze, ["~> 3.1.10"])
    s.add_runtime_dependency(%q<bcrypt_pbkdf>.freeze, [">= 1.0", "< 2.0"])
    s.add_runtime_dependency(%q<highline>.freeze, ["~> 1.6.21"])
    s.add_runtime_dependency(%q<i18n>.freeze, [">= 0.8"])
    s.add_runtime_dependency(%q<linux_admin>.freeze, ["~> 2.0"])
    s.add_runtime_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_runtime_dependency(%q<net-scp>.freeze, ["~> 1.2.1"])
    s.add_runtime_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<pg>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<pg-logical_replication>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rbnacl>.freeze, [">= 3.2", "< 5.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, ["~> 6.1.6", ">= 6.1.6.1"])
    s.add_dependency(%q<activesupport>.freeze, ["~> 6.1.6", ">= 6.1.6.1"])
    s.add_dependency(%q<awesome_spawn>.freeze, ["~> 1.4"])
    s.add_dependency(%q<bcrypt>.freeze, ["~> 3.1.10"])
    s.add_dependency(%q<bcrypt_pbkdf>.freeze, [">= 1.0", "< 2.0"])
    s.add_dependency(%q<highline>.freeze, ["~> 1.6.21"])
    s.add_dependency(%q<i18n>.freeze, [">= 0.8"])
    s.add_dependency(%q<linux_admin>.freeze, ["~> 2.0"])
    s.add_dependency(%q<manageiq-password>.freeze, ["< 2"])
    s.add_dependency(%q<net-scp>.freeze, ["~> 1.2.1"])
    s.add_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<pg-logical_replication>.freeze, [">= 0"])
    s.add_dependency(%q<rbnacl>.freeze, [">= 3.2", "< 5.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
