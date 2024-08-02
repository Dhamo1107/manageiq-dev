# -*- encoding: utf-8 -*-
# stub: manageiq-providers-awx 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-awx".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the AWX provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/awx/automation_manager.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/amazon_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/azure_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/cloud_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/configuration_script.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/configuration_script_source.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/configuration_workflow.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/configured_system.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/event_parser.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/google_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/inventory.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/job.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/job/status.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/job/status_mixin.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/machine_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/network_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/openstack_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/playbook.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/refresher.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/rhv_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/satellite6_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/scm_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/template_runner.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/tower_api.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/vault_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/vmware_credential.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/workflow_job.rb".freeze, "app/models/manageiq/providers/awx/automation_manager/workflow_job/status.rb".freeze, "app/models/manageiq/providers/awx/inventory.rb".freeze, "app/models/manageiq/providers/awx/inventory/collector.rb".freeze, "app/models/manageiq/providers/awx/inventory/collector/automation_manager.rb".freeze, "app/models/manageiq/providers/awx/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/awx/inventory/parser.rb".freeze, "app/models/manageiq/providers/awx/inventory/parser/automation_manager.rb".freeze, "app/models/manageiq/providers/awx/inventory/persister.rb".freeze, "app/models/manageiq/providers/awx/inventory/persister/automation_manager.rb".freeze, "app/models/manageiq/providers/awx/inventory/persister/definitions/automation_collections.rb".freeze, "app/models/manageiq/providers/awx/inventory/persister/target_collection.rb".freeze, "app/models/manageiq/providers/awx/provider.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/awx.rb".freeze, "lib/manageiq/providers/awx/engine.rb".freeze, "lib/manageiq/providers/awx/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/awx.rake".freeze, "lib/tasks_private/spec.rake".freeze, "lib/tasks_private/spec_helper.rake".freeze, "locale/.keep".freeze, "manageiq-providers-awx.gemspec".freeze, "systemd/manageiq-providers-awx_automation_manager_event_catcher.target".freeze, "systemd/manageiq-providers-awx_automation_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-awx_automation_manager_refresh.target".freeze, "systemd/manageiq-providers-awx_automation_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-awx".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the AWX provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ansible_tower_client>.freeze, ["~> 0.20", ">= 0.21.2"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<ansible_tower_client>.freeze, ["~> 0.20", ">= 0.21.2"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
