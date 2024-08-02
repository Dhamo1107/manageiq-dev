# -*- encoding: utf-8 -*-
# stub: manageiq-providers-ibm_power_hmc 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-ibm_power_hmc".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the IBM Power HMC provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/event_parser.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/event_target_parser.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/host.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/lpar.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/media_repository.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/memory_resource_pool.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/metrics_capture.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/metrics_capture_mixin.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/metrics_collector_worker.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/processor_resource_pool.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/provision.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/provision/cloning.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/refresher.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/resource_pool.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/storage.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/template.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/vios.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/vm.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/infra_manager/vm/reconfigure.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/collector.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/collector/infra_manager.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/parser.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/parser/infra_manager.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/parser/target_collection.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/persister.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/persister/infra_manager.rb".freeze, "app/models/manageiq/providers/ibm_power_hmc/inventory/persister/target_collection.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "content/miq_dialogs/miq_provision_ibm_power_hmc_dialogs_clone_to_template.yaml".freeze, "content/miq_dialogs/miq_provision_ibm_power_hmc_dialogs_template.yaml".freeze, "content/reports/1000_IBM Power - Hosts/010_HMC Hosts.yaml".freeze, "content/reports/1000_IBM Power - Virtual Machines/011_All PowerHMC VMs.yaml".freeze, "lib/manageiq/providers/ibm_power_hmc.rb".freeze, "lib/manageiq/providers/ibm_power_hmc/engine.rb".freeze, "lib/manageiq/providers/ibm_power_hmc/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-ibm_power_hmc.gemspec".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_event_catcher.target".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_metrics_collector.target".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_metrics_collector@.service".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_refresh.target".freeze, "systemd/manageiq-providers-ibm_power_hmc_infra_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-ibm_power_hmc".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the IBM Power HMC provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ibm_power_hmc>.freeze, ["~> 0.25.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<ibm_power_hmc>.freeze, ["~> 0.25.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
