# -*- encoding: utf-8 -*-
# stub: rufus-lru 1.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "rufus-lru".freeze
  s.version = "1.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Mettraux".freeze]
  s.date = "2016-05-07"
  s.description = "LruHash class, a Hash with a max size, controlled by a LRU mechanism".freeze
  s.email = ["jmettraux@gmail.com".freeze]
  s.homepage = "http://github.com/jmettraux/rufus-lru".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A Hash with a max size, controlled by a LRU mechanism".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.4.0"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 3.4.0"])
  end
end
