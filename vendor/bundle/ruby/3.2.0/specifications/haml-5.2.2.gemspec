# -*- encoding: utf-8 -*-
# stub: haml 5.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "haml".freeze
  s.version = "5.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/haml/haml/issues", "changelog_uri" => "https://github.com/haml/haml/blob/main/CHANGELOG.md", "documentation_uri" => "http://haml.info/docs.html", "homepage_uri" => "http://haml.info", "mailing_list_uri" => "https://groups.google.com/forum/?fromgroups#!forum/haml", "source_code_uri" => "https://github.com/haml/haml" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Natalie Weizenbaum".freeze, "Hampton Catlin".freeze, "Norman Clarke".freeze, "Akira Matsuda".freeze]
  s.date = "2021-07-27"
  s.description = "Haml (HTML Abstraction Markup Language) is a layer on top of HTML or XML that's\ndesigned to express the structure of documents in a non-repetitive, elegant, and\neasy way by using indentation rather than closing tags and allowing Ruby to be\nembedded with ease. It was originally envisioned as a plugin for Ruby on Rails,\nbut it can function as a stand-alone templating engine.\n".freeze
  s.email = ["haml@googlegroups.com".freeze, "ronnie@dio.jp".freeze]
  s.executables = ["haml".freeze]
  s.files = ["bin/haml".freeze]
  s.homepage = "http://haml.info/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "An elegant, structured (X)HTML/XML templating engine.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<temple>.freeze, [">= 0.8.0"])
  s.add_runtime_dependency(%q<tilt>.freeze, [">= 0"])
  s.add_development_dependency(%q<rails>.freeze, [">= 4.0.0"])
  s.add_development_dependency(%q<rbench>.freeze, [">= 0"])
  s.add_development_dependency(%q<minitest>.freeze, [">= 4.0"])
  s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
end
