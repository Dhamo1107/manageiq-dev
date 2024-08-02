# -*- encoding: utf-8 -*-
# stub: fog-kubevirt 1.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-kubevirt".freeze
  s.version = "1.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Kliczewski".freeze, "Moti Asayag".freeze, "Paulo Ribeiro".freeze, "Gilles Dubreuil".freeze, "Adam Grare".freeze, "Boris Odnopozov".freeze, "Shira Maximov".freeze, "yifatmakias".freeze, "Beni Cherniavsky-Paskin".freeze, "Wesley Beary".freeze]
  s.date = "2022-05-11"
  s.description = "This library can be used as a module for `fog`.".freeze
  s.email = ["piotr.kliczewski@gmail.com".freeze, "masayag@redhat.com".freeze, "plribeiro3000@gmail.com".freeze, "gilles@redhat.com".freeze, "adam@grare.com".freeze, "bodnopoz@redhat.com".freeze, "shiramaximov@gmail.com".freeze, "ymakias@redhat.com".freeze, "cben@redhat.com".freeze, "geemus@gmail.com".freeze]
  s.homepage = "https://github.com/fog/fog-kubevirt".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Module for the 'fog' gem to support Kubevirt.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.67"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.5"])
    s.add_runtime_dependency(%q<fog-core>.freeze, ["~> 2.1"])
    s.add_runtime_dependency(%q<kubeclient>.freeze, [">= 4.9.3", "< 5.0.0"])
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.67"])
    s.add_dependency(%q<vcr>.freeze, ["~> 4.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.5"])
    s.add_dependency(%q<fog-core>.freeze, ["~> 2.1"])
    s.add_dependency(%q<kubeclient>.freeze, [">= 4.9.3", "< 5.0.0"])
  end
end
