# -*- encoding: utf-8 -*-
# stub: manageiq-providers-autosde 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-autosde".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Autosde provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/assets/images/svg/vendor-autosde.svg".freeze, "app/decorators/manageiq/providers/autosde/storage_manager_decorator.rb".freeze, "app/models/manageiq/providers/autosde/inventory.rb".freeze, "app/models/manageiq/providers/autosde/inventory/collector.rb".freeze, "app/models/manageiq/providers/autosde/inventory/collector/storage_manager.rb".freeze, "app/models/manageiq/providers/autosde/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/autosde/inventory/parser.rb".freeze, "app/models/manageiq/providers/autosde/inventory/parser/storage_manager.rb".freeze, "app/models/manageiq/providers/autosde/inventory/persister.rb".freeze, "app/models/manageiq/providers/autosde/inventory/persister/storage_manager.rb".freeze, "app/models/manageiq/providers/autosde/inventory/persister/target_collection.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/autosde_client.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/cloud_volume.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/cloud_volume_snapshot.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/cluster_volume_mapping.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/ems_refresh_workflow.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/host_initiator.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/host_initiator_group.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/host_volume_mapping.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/physical_storage.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/refresher.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/storage_resource.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/storage_service.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/storage_service_resource_attachment.rb".freeze, "app/models/manageiq/providers/autosde/storage_manager/volume_mapping.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "content/dashboard/widgets/chart_autosde_fixed_events_last_week.yaml".freeze, "content/dashboard/widgets/report_autosde_events.yaml".freeze, "content/notification_types.yml".freeze, "content/reports/1000_AutoSDE Events - Management/010_AutoSDE_events.yaml".freeze, "lib/manageiq/providers/autosde.rb".freeze, "lib/manageiq/providers/autosde/engine.rb".freeze, "lib/manageiq/providers/autosde/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-autosde.gemspec".freeze, "systemd/manageiq-providers-autosde_storage_manager_event_catcher.target".freeze, "systemd/manageiq-providers-autosde_storage_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-autosde_storage_manager_refresh.target".freeze, "systemd/manageiq-providers-autosde_storage_manager_refresh@.service".freeze, "zanata.xml".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-autosde".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Autosde provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<autosde_openapi_client>.freeze, ["~> 3.2.0"])
    s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<autosde_openapi_client>.freeze, ["~> 3.2.0"])
    s.add_dependency(%q<typhoeus>.freeze, ["~> 1.4"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
