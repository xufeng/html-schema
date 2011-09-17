# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "html-schema"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lance Pollard"]
  s.date = "2011-09-17"
  s.description = "\nA unified interface to the semantic web.  You tell your ERB/Haml this is a \"person\" object,\nand it will give you the schema.org microdata, the microformats, or both.  Cuts out having to\nremember these \"non-human\" keys :).\n"
  s.email = "lancejpollard@gmail.com"
  s.files = ["Rakefile", "lib/html-schema/api/attribute.rb", "lib/html-schema/api/object.rb", "lib/html-schema/api.rb", "lib/html-schema/attribute.rb", "lib/html-schema/configuration.rb", "lib/html-schema/dsl.rb", "lib/html-schema/helper.rb", "lib/html-schema/microdata/attribute.rb", "lib/html-schema/microdata/object.rb", "lib/html-schema/microdata.rb", "lib/html-schema/microformat/attribute.rb", "lib/html-schema/microformat/object.rb", "lib/html-schema/microformat.rb", "lib/html-schema/object.rb", "lib/html-schema/railtie.rb", "lib/html-schema.rb"]
  s.homepage = "http://github.com/viatropos/html-schema"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "html-schema"
  s.rubygems_version = "1.8.10"
  s.summary = "Schema.org API for Ruby (Microdata and Microformats under one API)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
