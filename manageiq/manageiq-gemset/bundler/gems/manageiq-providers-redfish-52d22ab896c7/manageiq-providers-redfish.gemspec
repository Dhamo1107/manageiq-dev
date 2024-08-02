# -*- encoding: utf-8 -*-
# stub: manageiq-providers-redfish 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-redfish".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Redfish provider.".freeze
  s.files = [".babelrc".freeze, ".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".postcssrc.yml".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, ".yarn/releases/yarn-3.5.0.cjs".freeze, ".yarnrc.yml".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/helpers/manageiq/providers/redfish/toolbar_overrides/physical_server_center.rb".freeze, "app/helpers/manageiq/providers/redfish/toolbar_overrides/physical_servers_center.rb".freeze, "app/javascript/components/firmware-update.schema.js".freeze, "app/javascript/components/redfish-server-firmware-update-dialog.jsx".freeze, "app/javascript/components/redfish-server-provision-dialog.jsx".freeze, "app/javascript/components/server-provision.schema.js".freeze, "app/javascript/packs/component-definition-common.js".freeze, "app/javascript/utils/common.js".freeze, "app/models/manageiq/providers/redfish/inventory.rb".freeze, "app/models/manageiq/providers/redfish/inventory/collector.rb".freeze, "app/models/manageiq/providers/redfish/inventory/collector/physical_infra_manager.rb".freeze, "app/models/manageiq/providers/redfish/inventory/parser.rb".freeze, "app/models/manageiq/providers/redfish/inventory/parser/physical_infra_manager.rb".freeze, "app/models/manageiq/providers/redfish/inventory/persister.rb".freeze, "app/models/manageiq/providers/redfish/inventory/persister/definitions/physical_infra_collections.rb".freeze, "app/models/manageiq/providers/redfish/inventory/persister/physical_infra_manager.rb".freeze, "app/models/manageiq/providers/redfish/manager_mixin.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/event_parser.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/firmware_update_task.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/firmware_update_task/state_machine.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/operations.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/operations/firmware.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/operations/led.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/operations/power.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/physical_chassis.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/physical_rack.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/physical_server.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/physical_server/provisioning.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/provision.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/redfish/physical_infra_manager/refresher.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/redfish.rb".freeze, "lib/manageiq/providers/redfish/engine.rb".freeze, "lib/manageiq/providers/redfish/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/redfish.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-redfish.gemspec".freeze, "package.json".freeze, "systemd/manageiq-providers-redfish_physical_infra_manager_event_catcher.target".freeze, "systemd/manageiq-providers-redfish_physical_infra_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-redfish_physical_infra_manager_refresh.target".freeze, "systemd/manageiq-providers-redfish_physical_infra_manager_refresh@.service".freeze, "yarn.lock".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-redfish".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Redfish provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<redfish_client>.freeze, ["~> 0.5.1"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<redfish_tools>.freeze, ["~> 0.1"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<redfish_client>.freeze, ["~> 0.5.1"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<redfish_tools>.freeze, ["~> 0.1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
