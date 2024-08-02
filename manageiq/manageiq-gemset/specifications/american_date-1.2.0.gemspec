# -*- encoding: utf-8 -*-
# stub: american_date 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "american_date".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/jeremyevans/ruby-american_date/issues", "changelog_uri" => "https://github.com/jeremyevans/ruby-american_date/blob/master/CHANGELOG", "source_code_uri" => "https://github.com/jeremyevans/ruby-american_date" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeremy Evans".freeze]
  s.date = "2021-11-17"
  s.description = "American style month/day/year date parsing for ruby 1.9+".freeze
  s.email = "code@jeremyevans.net".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "CHANGELOG".freeze, "MIT-LICENSE".freeze]
  s.files = ["CHANGELOG".freeze, "MIT-LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "https://github.com/jeremyevans/ruby-american_date".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--quiet".freeze, "--inline-source".freeze, "--line-numbers".freeze, "--title".freeze, "american_date: American style month/day/year date parsing for ruby 1.9+".freeze, "--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "American style month/day/year date parsing for ruby 1.9+".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<minitest>.freeze, [">= 5"])
    s.add_development_dependency(%q<minitest-global_expectations>.freeze, [">= 0"])
  else
    s.add_dependency(%q<minitest>.freeze, [">= 5"])
    s.add_dependency(%q<minitest-global_expectations>.freeze, [">= 0"])
  end
end
