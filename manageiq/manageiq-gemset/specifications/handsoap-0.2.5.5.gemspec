# -*- encoding: utf-8 -*-
# stub: handsoap 0.2.5.5 ruby lib

Gem::Specification.new do |s|
  s.name = "handsoap".freeze
  s.version = "0.2.5.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Troels Knak-Nielsen".freeze]
  s.date = "2009-06-08"
  s.description = "Handsoap is a library for creating SOAP clients in Ruby".freeze
  s.email = "troelskn@gmail.com".freeze
  s.extra_rdoc_files = ["README.markdown".freeze]
  s.files = ["README.markdown".freeze]
  s.homepage = "http://github.com/troelskn/handsoap".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Handsoap is a library for creating SOAP clients in Ruby".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.2.3"])
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.2.3"])
  end
end
