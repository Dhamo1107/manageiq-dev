# -*- encoding: utf-8 -*-
# stub: apipie-bindings 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "apipie-bindings".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Martin Ba\u010Dovsk\u00FD".freeze]
  s.date = "2020-05-29"
  s.description = "Bindings for API calls that are documented with Apipie. Bindings are generated on the fly.\n".freeze
  s.email = "mbacovsk@redhat.com".freeze
  s.extra_rdoc_files = ["README.md".freeze, "doc/release_notes.md".freeze]
  s.files = ["README.md".freeze, "doc/release_notes.md".freeze]
  s.homepage = "http://github.com/Apipie/apipie-bindings".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "The Ruby bindings for Apipie documented APIs".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<json>.freeze, [">= 1.2.1"])
    s.add_runtime_dependency(%q<rest-client>.freeze, [">= 1.6.5", "< 3.0.0"])
    s.add_runtime_dependency(%q<oauth>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<thor>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, ["= 4.7.4"])
    s.add_development_dependency(%q<minitest-spec-context>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<ci_reporter>.freeze, [">= 1.6.3", "< 2.0.0"])
  else
    s.add_dependency(%q<json>.freeze, [">= 1.2.1"])
    s.add_dependency(%q<rest-client>.freeze, [">= 1.6.5", "< 3.0.0"])
    s.add_dependency(%q<oauth>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["= 4.7.4"])
    s.add_dependency(%q<minitest-spec-context>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<ci_reporter>.freeze, [">= 1.6.3", "< 2.0.0"])
  end
end
