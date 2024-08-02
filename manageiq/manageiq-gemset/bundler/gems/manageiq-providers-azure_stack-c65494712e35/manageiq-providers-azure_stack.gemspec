# -*- encoding: utf-8 -*-
# stub: manageiq-providers-azure_stack 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-azure_stack".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Azure Stack provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/availability_zone.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/event_parser.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/event_target_parser.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/flavor.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/metrics_capture.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/orchestration_service_option_converter.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/orchestration_stack.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/orchestration_stack/status.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/orchestration_template.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/refresher.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/resource_group.rb".freeze, "app/models/manageiq/providers/azure_stack/cloud_manager/vm.rb".freeze, "app/models/manageiq/providers/azure_stack/ems_ref_mixin.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/cloud_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/cloud_manager/v2017_03_09.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/cloud_manager/v2018_03_01.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/network_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/network_manager/v2017_03_09.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/network_manager/v2018_03_01.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/target_collection/v2017_03_09.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/collector/target_collection/v2018_03_01.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/parser.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/parser/cloud_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/parser/network_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister/cloud_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister/definitions/cloud_collections.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister/definitions/network_collections.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister/network_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/inventory/persister/target_collection.rb".freeze, "app/models/manageiq/providers/azure_stack/manager_mixin.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/cloud_network.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/cloud_subnet.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/network_port.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/refresher.rb".freeze, "app/models/manageiq/providers/azure_stack/network_manager/security_group.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/initializers/inflections.rb".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/azure_stack.rb".freeze, "lib/manageiq/providers/azure_stack/engine.rb".freeze, "lib/manageiq/providers/azure_stack/version.rb".freeze, "lib/patches/ms_rest_azure/password_token_provider.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/azure_stack.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-azure_stack.gemspec".freeze, "systemd/manageiq-providers-azure_stack_cloud_manager_event_catcher.target".freeze, "systemd/manageiq-providers-azure_stack_cloud_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-azure_stack_cloud_manager_refresh.target".freeze, "systemd/manageiq-providers-azure_stack_cloud_manager_refresh@.service".freeze, "systemd/manageiq-providers-azure_stack_network_manager_refresh.target".freeze, "systemd/manageiq-providers-azure_stack_network_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-azure_stack".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Azure Stack provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<azure_mgmt_compute>.freeze, ["~> 0.20"])
    s.add_runtime_dependency(%q<azure_mgmt_monitor>.freeze, ["~> 0.17"])
    s.add_runtime_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.24"])
    s.add_runtime_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.18"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<azure_mgmt_compute>.freeze, ["~> 0.20"])
    s.add_dependency(%q<azure_mgmt_monitor>.freeze, ["~> 0.17"])
    s.add_dependency(%q<azure_mgmt_network>.freeze, ["~> 0.24"])
    s.add_dependency(%q<azure_mgmt_resources>.freeze, ["~> 0.18"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
