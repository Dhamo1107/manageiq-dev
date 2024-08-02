# -*- encoding: utf-8 -*-
# stub: binary_struct 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "binary_struct".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Oleg Barenboim".freeze, "Jason Frey".freeze]
  s.date = "2015-06-18"
  s.description = "\nBinaryStruct is a class for dealing with binary structured data.  It simplifies\nexpressing what the binary structure looks like, with the ability to name the\nparts.  Given this definition, it is easy to encode/decode the binary structure\nfrom/to a Hash.\n".freeze
  s.email = ["chessbyte@gmail.com".freeze, "fryguy9@gmail.com".freeze]
  s.homepage = "http://github.com/ManageIQ/binary_struct".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "BinaryStruct is a class for dealing with binary structured data.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
