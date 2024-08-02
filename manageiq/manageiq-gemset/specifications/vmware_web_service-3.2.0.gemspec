# -*- encoding: utf-8 -*-
# stub: vmware_web_service 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "vmware_web_service".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.date = "2023-03-04"
  s.description = "A ruby interface to Vmware Web Services SDK".freeze
  s.homepage = "https://github.com/ManageIQ/vmware_web_service".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A ruby interface to Vmware Web Services SDK".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.2.4.3", "< 7.0"])
    s.add_runtime_dependency(%q<ffi-vix_disk_lib>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<handsoap>.freeze, ["~> 0.2.5"])
    s.add_runtime_dependency(%q<httpclient>.freeze, ["~> 2.8.0"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, [">= 3.2", "< 5"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.2.4.3", "< 7.0"])
    s.add_dependency(%q<ffi-vix_disk_lib>.freeze, ["~> 1.1"])
    s.add_dependency(%q<handsoap>.freeze, ["~> 0.2.5"])
    s.add_dependency(%q<httpclient>.freeze, ["~> 2.8.0"])
    s.add_dependency(%q<more_core_extensions>.freeze, [">= 3.2", "< 5"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
