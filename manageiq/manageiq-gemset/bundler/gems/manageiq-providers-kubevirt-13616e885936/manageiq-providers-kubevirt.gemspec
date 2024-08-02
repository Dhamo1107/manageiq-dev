# -*- encoding: utf-8 -*-
# stub: manageiq-providers-kubevirt 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-kubevirt".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the KubeVirt provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/kubevirt/constants.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/cluster.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/connection.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/host.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/provision.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/provision/cloning.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/refresher.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/storage.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/template.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/vm.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/vm/operations.rb".freeze, "app/models/manageiq/providers/kubevirt/infra_manager/vm/operations/power.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/collector.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/parser.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/parser/full_refresh.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/parser/partial_refresh.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/parser/partial_target_refresh.rb".freeze, "app/models/manageiq/providers/kubevirt/inventory/persister.rb".freeze, "app/models/manageiq/providers/kubevirt/refresh_memory.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/settings.yml".freeze, "content/miq_dialogs/miq_provision_kubevirt_dialogs_clone_to_vm.yaml".freeze, "content/miq_dialogs/miq_provision_kubevirt_dialogs_template.yaml".freeze, "docs/virtual_machine_template_guide.adoc".freeze, "lib/manageiq/providers/kube_virt.rb".freeze, "lib/manageiq/providers/kubevirt.rb".freeze, "lib/manageiq/providers/kubevirt/engine.rb".freeze, "lib/manageiq/providers/kubevirt/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/kubevirt.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-kubevirt.gemspec".freeze, "manifests/README.adoc".freeze, "manifests/account-kubernetes.yml".freeze, "manifests/account-openshift.yml".freeze, "manifests/example-template-windows.yml".freeze, "manifests/example-template.yml".freeze, "manifests/working-template.yml".freeze, "systemd/manageiq-providers-kubevirt_infra_manager_refresh.target".freeze, "systemd/manageiq-providers-kubevirt_infra_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-kubevirt".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the KubeVirt provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-kubevirt>.freeze, ["~> 1.0", ">= 1.3.5"])
    s.add_runtime_dependency(%q<manageiq-providers-kubernetes>.freeze, ["~> 0.1.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<fog-kubevirt>.freeze, ["~> 1.0", ">= 1.3.5"])
    s.add_dependency(%q<manageiq-providers-kubernetes>.freeze, ["~> 0.1.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
