# -*- encoding: utf-8 -*-
# stub: ansible_tower_client 0.21.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ansible_tower_client".freeze
  s.version = "0.21.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Dunne".freeze, "Drew Bomhof".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-07-09"
  s.description = "Ansible Tower REST API wrapper gem".freeze
  s.email = ["bdunne@redhat.com".freeze, "dbomhof@redhat.com".freeze]
  s.homepage = "https://github.com/Ansible/ansible_tower_client_ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ansible Tower REST API wrapper gem".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<factory_bot>.freeze, ["~> 4.11"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<faraday_middleware>.freeze, [">= 0"])
    s.add_dependency(%q<more_core_extensions>.freeze, ["~> 4.0"])
    s.add_dependency(%q<factory_bot>.freeze, ["~> 4.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
