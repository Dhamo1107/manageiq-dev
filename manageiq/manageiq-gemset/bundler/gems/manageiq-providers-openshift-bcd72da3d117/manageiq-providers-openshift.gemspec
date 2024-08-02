# -*- encoding: utf-8 -*-
# stub: manageiq-providers-openshift 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-openshift".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the OpenShift provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/openshift/container_manager.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/container.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/container_group.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/container_image.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/container_node.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/container_template.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/event_parser.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/metrics_collector_worker.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/options.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/orchestration_stack.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/orchestration_stack/status.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/refresh_worker/watch_thread.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/refresher.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/service_instance.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/service_offering.rb".freeze, "app/models/manageiq/providers/openshift/container_manager/service_parameters_set.rb".freeze, "app/models/manageiq/providers/openshift/inventory.rb".freeze, "app/models/manageiq/providers/openshift/inventory/collector.rb".freeze, "app/models/manageiq/providers/openshift/inventory/collector/container_manager.rb".freeze, "app/models/manageiq/providers/openshift/inventory/collector/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/openshift/inventory/parser.rb".freeze, "app/models/manageiq/providers/openshift/inventory/parser/container_manager.rb".freeze, "app/models/manageiq/providers/openshift/inventory/parser/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/openshift/inventory/parser/openshift_parser_mixin.rb".freeze, "app/models/manageiq/providers/openshift/inventory/persister.rb".freeze, "app/models/manageiq/providers/openshift/inventory/persister/container_manager.rb".freeze, "app/models/manageiq/providers/openshift/inventory/persister/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/openshift/monitoring_manager.rb".freeze, "app/models/manageiq/providers/openshift/monitoring_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/openshift/monitoring_manager/event_catcher/runner.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/openshift.rb".freeze, "lib/manageiq/providers/openshift/engine.rb".freeze, "lib/manageiq/providers/openshift/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/openshift.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-openshift.gemspec".freeze, "systemd/manageiq-providers-openshift_container_manager_event_catcher.target".freeze, "systemd/manageiq-providers-openshift_container_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-openshift_container_manager_metrics_collector.target".freeze, "systemd/manageiq-providers-openshift_container_manager_metrics_collector@.service".freeze, "systemd/manageiq-providers-openshift_container_manager_refresh.target".freeze, "systemd/manageiq-providers-openshift_container_manager_refresh@.service".freeze, "systemd/manageiq-providers-openshift_monitoring_manager_event_catcher.target".freeze, "systemd/manageiq-providers-openshift_monitoring_manager_event_catcher@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-openshift".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the OpenShift provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<manageiq-providers-kubernetes>.freeze, ["~> 0.1.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<recursive-open-struct>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<manageiq-providers-kubernetes>.freeze, ["~> 0.1.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<recursive-open-struct>.freeze, ["~> 1.1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
