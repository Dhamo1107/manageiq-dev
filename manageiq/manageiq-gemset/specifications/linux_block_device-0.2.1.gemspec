# -*- encoding: utf-8 -*-
# stub: linux_block_device 0.2.1 ruby lib
# stub: ext/linux_block_device/extconf.rb

Gem::Specification.new do |s|
  s.name = "linux_block_device".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rich Oliveri".freeze, "Oleg Barenboim".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-10-27"
  s.description = "Ruby module to interact with block devices on Linux platforms.".freeze
  s.email = ["roliveri@redhat.com".freeze, "chessbyte@gmail.com".freeze]
  s.extensions = ["ext/linux_block_device/extconf.rb".freeze]
  s.files = ["ext/linux_block_device/extconf.rb".freeze]
  s.homepage = "http://github.com/ManageIQ/linux_block_device".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby module to interact with block devices on Linux platforms.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
