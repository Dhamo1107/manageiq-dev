# -*- encoding: utf-8 -*-
# stub: manageiq-providers-foreman 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-foreman".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Foreman provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/foreman/configuration_manager.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/configuration_profile.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/configured_system.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/configured_system/placement.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/provision_task.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/provision_task/options_helper.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/provision_task/state_machine.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/foreman/configuration_manager/refresher.rb".freeze, "app/models/manageiq/providers/foreman/inventory.rb".freeze, "app/models/manageiq/providers/foreman/inventory/collector.rb".freeze, "app/models/manageiq/providers/foreman/inventory/collector/configuration_manager.rb".freeze, "app/models/manageiq/providers/foreman/inventory/collector/foreman.rb".freeze, "app/models/manageiq/providers/foreman/inventory/collector/provisioning_manager.rb".freeze, "app/models/manageiq/providers/foreman/inventory/parser.rb".freeze, "app/models/manageiq/providers/foreman/inventory/parser/configuration_manager.rb".freeze, "app/models/manageiq/providers/foreman/inventory/parser/foreman.rb".freeze, "app/models/manageiq/providers/foreman/inventory/parser/provisioning_manager.rb".freeze, "app/models/manageiq/providers/foreman/inventory/persister.rb".freeze, "app/models/manageiq/providers/foreman/inventory/persister/configuration_manager.rb".freeze, "app/models/manageiq/providers/foreman/inventory/persister/foreman.rb".freeze, "app/models/manageiq/providers/foreman/inventory/persister/provisioning_manager.rb".freeze, "app/models/manageiq/providers/foreman/provider.rb".freeze, "app/models/manageiq/providers/foreman/provisioning_manager.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/foreman.rb".freeze, "lib/manageiq/providers/foreman/engine.rb".freeze, "lib/manageiq/providers/foreman/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/foreman.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-foreman.gemspec".freeze, "systemd/manageiq-providers-foreman_configuration_manager_refresh.target".freeze, "systemd/manageiq-providers-foreman_configuration_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-foreman".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Foreman provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<foreman_api_client>.freeze, ["~> 1.0.2"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<foreman_api_client>.freeze, ["~> 1.0.2"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
