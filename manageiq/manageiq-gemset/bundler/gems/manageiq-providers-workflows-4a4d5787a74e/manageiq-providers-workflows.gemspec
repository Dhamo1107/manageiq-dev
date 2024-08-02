# -*- encoding: utf-8 -*-
# stub: manageiq-providers-workflows 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-workflows".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Workflows provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/workflows/automation_manager.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/configuration_script_source.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/credential.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/scm_credential.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/workflow.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/workflow_credential.rb".freeze, "app/models/manageiq/providers/workflows/automation_manager/workflow_instance.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/initializers/floe_docker_runner.rb".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/workflows.rb".freeze, "lib/manageiq/providers/workflows/engine.rb".freeze, "lib/manageiq/providers/workflows/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-workflows.gemspec".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-workflows".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Workflows provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<floe>.freeze, ["~> 0.2.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<floe>.freeze, ["~> 0.2.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
