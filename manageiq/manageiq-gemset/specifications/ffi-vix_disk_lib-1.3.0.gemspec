# -*- encoding: utf-8 -*-
# stub: ffi-vix_disk_lib 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ffi-vix_disk_lib".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jerry Keselman".freeze, "Rich Oliveri".freeze, "Jason Frey".freeze]
  s.date = "2022-12-21"
  s.description = "Ruby FFI Binding to VMware VixDiskLib.".freeze
  s.email = ["jerryk@redhat.com".freeze, "roliveri@redhat.com".freeze, "jfrey@redhat.com".freeze]
  s.homepage = "http://github.com/ManageIQ/ffi-vix_disk_lib".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby FFI Binding to VMware VixDiskLib.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
