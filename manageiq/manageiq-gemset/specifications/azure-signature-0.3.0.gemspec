# -*- encoding: utf-8 -*-
# stub: azure-signature 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "azure-signature".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ManageIQ/azure-signature/issues", "changelog_uri" => "https://github.com/ManageIQ/azure-signature/blob/master/CHANGELOG.md", "documentation_uri" => "https://github.com/ManageIQ/azure-signature/wiki", "homepage_uri" => "https://github.com/ManageIQ/azure-signature", "source_code_uri" => "https://github.com/ManageIQ/azure-signature", "wiki_uri" => "https://github.com/ManageIQ/azure-signature/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel J. Berger".freeze]
  s.date = "2020-03-19"
  s.description = "    The azure-signature library generates storage signatures for\n    Microsoft Azure's cloud platform. You can use this to access\n    Azure storage services - tables, blobs, queues and files.\n".freeze
  s.email = "djberg96@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze, "CHANGELOG.md".freeze, "MANIFEST.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "MANIFEST.md".freeze, "README.md".freeze]
  s.homepage = "http://github.com/djberg96/azure-signature".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Generate authentication signatures for Azure".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2.2"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.2.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
  end
end
