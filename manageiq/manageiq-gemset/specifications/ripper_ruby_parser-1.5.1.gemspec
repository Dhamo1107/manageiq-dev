# -*- encoding: utf-8 -*-
# stub: ripper_ruby_parser 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ripper_ruby_parser".freeze
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matijs van Zuijlen".freeze]
  s.date = "2019-03-21"
  s.description = "    RipperRubyParser is a parser for Ruby based on Ripper that aims to be a\n    drop-in replacement for RubyParser.\n".freeze
  s.email = ["matijs@matijs.net".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://www.github.com/mvz/ripper_ruby_parser".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Parse with Ripper, produce sexps that are compatible with RubyParser.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sexp_processor>.freeze, ["~> 4.10"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.2"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<ruby_parser>.freeze, ["~> 3.12.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<sexp_processor>.freeze, ["~> 4.10"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<ruby_parser>.freeze, ["~> 3.12.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
