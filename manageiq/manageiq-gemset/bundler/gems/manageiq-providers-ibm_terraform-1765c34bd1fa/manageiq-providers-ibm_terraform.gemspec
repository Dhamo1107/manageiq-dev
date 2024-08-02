# -*- encoding: utf-8 -*-
# stub: manageiq-providers-ibm_terraform 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-ibm_terraform".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the IBM Terraform provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/assets/images/svg/vendor-alibaba.svg".freeze, "app/assets/images/svg/vendor-huawei.svg".freeze, "app/assets/images/svg/vendor-ibm_terraform_configuration.svg".freeze, "app/assets/images/svg/vendor-nutanix.svg".freeze, "app/assets/images/svg/vendor-tencent.svg".freeze, "app/decorators/manageiq/providers/ibm_terraform/configuration_manager/configured_system_decorator.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/configuration_profile.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/configured_system.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/orchestration_stack.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/ibm_terraform/configuration_manager/refresher.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/collector.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/collector/configuration_manager.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/parser.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/parser/configuration_manager.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/persister.rb".freeze, "app/models/manageiq/providers/ibm_terraform/inventory/persister/configuration_manager.rb".freeze, "app/models/manageiq/providers/ibm_terraform/provider.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/ibm_terraform.rb".freeze, "lib/manageiq/providers/ibm_terraform/engine.rb".freeze, "lib/manageiq/providers/ibm_terraform/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/manageiq-providers-ibm_terraform.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-ibm_terraform.gemspec".freeze, "systemd/manageiq-providers-ibm_terraform_configuration_manager_refresh.target".freeze, "systemd/manageiq-providers-ibm_terraform_configuration_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-ibm_terraform".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the IBM Terraform provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
