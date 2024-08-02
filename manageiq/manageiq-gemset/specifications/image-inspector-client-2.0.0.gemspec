# -*- encoding: utf-8 -*-
# stub: image-inspector-client 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "image-inspector-client".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mooli Tayer".freeze]
  s.date = "2018-05-28"
  s.description = "A client for image_inspector REST API".freeze
  s.email = ["mtayer@redhat.com".freeze]
  s.homepage = "https://github.com/openshift/image-inspector-client-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A client for image_inspector REST API".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0.1"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
    s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<recursive-open-struct>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.0.1"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.49.1"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<recursive-open-struct>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0"])
  end
end
