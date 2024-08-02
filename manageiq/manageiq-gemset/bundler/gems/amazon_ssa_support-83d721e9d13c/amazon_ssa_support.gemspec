# -*- encoding: utf-8 -*-
# stub: amazon_ssa_support 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "amazon_ssa_support".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.date = "2023-09-12"
  s.description = "This is a ruby interface for SSA on Amazon EC2 instances and images".freeze
  s.executables = ["amazon_ssa_agent".freeze]
  s.files = [".codeclimate.yml".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, "CODE_OF_CONDUCT.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "amazon_ssa_support.gemspec".freeze, "bin/amazon_ssa_agent".freeze, "bin/console".freeze, "bin/setup".freeze, "lib/amazon_ssa_support.rb".freeze, "lib/amazon_ssa_support/instance_metadata.rb".freeze, "lib/amazon_ssa_support/logging.rb".freeze, "lib/amazon_ssa_support/miq_ec2_vm/miq_ec2_ebs_image.rb".freeze, "lib/amazon_ssa_support/miq_ec2_vm/miq_ec2_ebs_instance.rb".freeze, "lib/amazon_ssa_support/miq_ec2_vm/miq_ec2_ebs_vmbase.rb".freeze, "lib/amazon_ssa_support/miq_ec2_vm/miq_ec2_vm.rb".freeze, "lib/amazon_ssa_support/miq_ec2_vm/miq_ec2_vmbase.rb".freeze, "lib/amazon_ssa_support/rolling_s3_logger.rb".freeze, "lib/amazon_ssa_support/ssa_bucket.rb".freeze, "lib/amazon_ssa_support/ssa_common.rb".freeze, "lib/amazon_ssa_support/ssa_heartbeat.rb".freeze, "lib/amazon_ssa_support/ssa_queue.rb".freeze, "lib/amazon_ssa_support/ssa_queue_extractor.rb".freeze, "lib/amazon_ssa_support/version.rb".freeze, "lib/tasks/release.rake".freeze]
  s.homepage = "https://github.com/ManageIQ/amazon_ssa_support".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Supporting files and libraries for SmartState Analysis on Amazone EC2".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<aws-sdk-sqs>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<manageiq-gems-pending>.freeze, ["~> 0"])
    s.add_runtime_dependency(%q<manageiq-smartstate>.freeze, ["~> 0.2"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<handsoap>.freeze, ["= 0.2.5.5"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<aws-sdk-sqs>.freeze, ["~> 1.0"])
    s.add_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.0"])
    s.add_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.0"])
    s.add_dependency(%q<manageiq-gems-pending>.freeze, ["~> 0"])
    s.add_dependency(%q<manageiq-smartstate>.freeze, ["~> 0.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<handsoap>.freeze, ["= 0.2.5.5"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
