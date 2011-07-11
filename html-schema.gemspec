# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{html-schema}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lance Pollard"]
  s.date = %q{2011-07-11}
  s.description = %q{Unified Ruby API for HTML5 Microdata and Microformats}
  s.email = %q{lancejpollard@gmail.com}
  s.files = ["Rakefile", "lib/html-schema/api/attribute.rb", "lib/html-schema/api/object.rb", "lib/html-schema/api.rb", "lib/html-schema/attribute.rb", "lib/html-schema/configuration.rb", "lib/html-schema/dsl.rb", "lib/html-schema/helper.rb", "lib/html-schema/microdata/attribute.rb", "lib/html-schema/microdata/object.rb", "lib/html-schema/microdata.rb", "lib/html-schema/microformat/attribute.rb", "lib/html-schema/microformat/object.rb", "lib/html-schema/microformat.rb", "lib/html-schema/object.rb", "lib/html-schema.rb", "spec/schema_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/viatropos/html-schema}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{html-schema}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Unified Ruby API for HTML5 Microdata and Microformats}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
