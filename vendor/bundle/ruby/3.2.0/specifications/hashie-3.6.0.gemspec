# -*- encoding: utf-8 -*-
# stub: hashie 3.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hashie".freeze
  s.version = "3.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Bleigh".freeze, "Jerry Cheung".freeze]
  s.date = "2018-08-13"
  s.description = "Hashie is a collection of classes and mixins that make hashes more powerful.".freeze
  s.email = ["michael@intridea.com".freeze, "jollyjerry@gmail.com".freeze]
  s.homepage = "https://github.com/intridea/hashie".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Your friendly neighborhood hash library.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, ["< 11"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rspec-pending_for>.freeze, ["~> 0.1"])
end
