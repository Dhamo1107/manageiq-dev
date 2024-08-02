# -*- encoding: utf-8 -*-
# stub: prometheus-alert-buffer-client 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "prometheus-alert-buffer-client".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zohar Galor".freeze, "Yaacov Zamir".freeze]
  s.date = "2020-02-06"
  s.email = ["zgalor@redhat.com".freeze]
  s.homepage = "https://github.com/openshift/prometheus-alert-buffer-client-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A suite of reading alerts stored on a Prometheus Alert Buffer server.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<faraday>.freeze, [">= 0.9.2", "< 2.0.0"])
  else
    s.add_dependency(%q<faraday>.freeze, [">= 0.9.2", "< 2.0.0"])
  end
end
