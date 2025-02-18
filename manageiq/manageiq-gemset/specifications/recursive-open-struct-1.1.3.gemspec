# -*- encoding: utf-8 -*-
# stub: recursive-open-struct 1.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "recursive-open-struct".freeze
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["William (B.J.) Snow Orvis".freeze]
  s.date = "2020-10-16"
  s.description = "RecursiveOpenStruct is a subclass of OpenStruct. It differs from\nOpenStruct in that it allows nested hashes to be treated in a recursive\nfashion. For example:\n\n    ros = RecursiveOpenStruct.new({ :a => { :b => 'c' } })\n    ros.a.b # 'c'\n\nAlso, nested hashes can still be accessed as hashes:\n\n    ros.a_as_a_hash # { :b => 'c' }\n".freeze
  s.email = "aetherknight@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "https://github.com/aetherknight/recursive-open-struct".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "OpenStruct subclass that returns nested hash attributes as RecursiveOpenStructs".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
