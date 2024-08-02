# -*- encoding: utf-8 -*-
# stub: manageiq-consumption 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-consumption".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "Consumption plugin for ManageIQ.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/helpers/manageiq/showback/time_converter_helper.rb".freeze, "app/helpers/manageiq/showback/units_converter_helper.rb".freeze, "app/helpers/manageiq/showback/utils_helper.rb".freeze, "app/models/manageiq/showback/column_units.yml".freeze, "app/models/manageiq/showback/data_rollup.rb".freeze, "app/models/manageiq/showback/data_rollup/cpu.rb".freeze, "app/models/manageiq/showback/data_rollup/disk.rb".freeze, "app/models/manageiq/showback/data_rollup/fixed.rb".freeze, "app/models/manageiq/showback/data_rollup/flavor.rb".freeze, "app/models/manageiq/showback/data_rollup/mem.rb".freeze, "app/models/manageiq/showback/data_rollup/metering.rb".freeze, "app/models/manageiq/showback/data_rollup/net.rb".freeze, "app/models/manageiq/showback/data_rollup/storage.rb".freeze, "app/models/manageiq/showback/data_view.rb".freeze, "app/models/manageiq/showback/envelope.rb".freeze, "app/models/manageiq/showback/input_measure.rb".freeze, "app/models/manageiq/showback/manager.rb".freeze, "app/models/manageiq/showback/price_plan.rb".freeze, "app/models/manageiq/showback/rate.rb".freeze, "app/models/manageiq/showback/tier.rb".freeze, "bin/before_install".freeze, "bin/console".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/initializers/money.rb".freeze, "config/settings.yml".freeze, "db/fixtures/input_measures.yml".freeze, "db/fixtures/price_plans.yml".freeze, "docs/README.md".freeze, "docs/benchmarks/README.md".freeze, "docs/benchmarks/benchmark_events.rb".freeze, "docs/demo/README.md".freeze, "docs/demo/seed_clean_db.rb".freeze, "docs/demo/seed_play_data.rb".freeze, "lib/manageiq/consumption.rb".freeze, "lib/manageiq/showback/engine.rb".freeze, "lib/manageiq/showback/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-consumption.gemspec".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-consumption".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Consumption plugin for ManageIQ.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<money-rails>.freeze, ["~> 1.9"])
    s.add_runtime_dependency(%q<hashdiff>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<money-rails>.freeze, ["~> 1.9"])
    s.add_dependency(%q<hashdiff>.freeze, ["~> 1.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
