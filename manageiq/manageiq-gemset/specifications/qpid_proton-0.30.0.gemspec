# -*- encoding: utf-8 -*-
# stub: qpid_proton 0.30.0 ruby lib
# stub: ext/cproton/extconf.rb

Gem::Specification.new do |s|
  s.name = "qpid_proton".freeze
  s.version = "0.30.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Darryl L. Pierce".freeze, "Alan Conway".freeze]
  s.date = "2019-12-19"
  s.description = "Proton is a high performance, lightweight messaging library. It can be used in\nthe widest range of messaging applications including brokers, client libraries,\nrouters, bridges, proxies, and more. Proton is based on the AMQP 1.0 messaging\nstandard.\n".freeze
  s.email = ["proton@qpid.apache.org".freeze]
  s.extensions = ["ext/cproton/extconf.rb".freeze]
  s.files = ["ext/cproton/extconf.rb".freeze]
  s.homepage = "http://qpid.apache.org/proton".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby language bindings for the Qpid Proton messaging framework".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version
end
