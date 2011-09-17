require 'rake'
require "rake/rdoctask"
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name              = "html-schema"
  s.authors           = ["Lance Pollard"]
  s.version           = "0.5.0"
  s.summary           = "Schema.org API for Ruby (Microdata and Microformats under one API)"
  s.homepage          = "http://github.com/viatropos/html-schema"
  s.license           = "MIT"
  s.email             = "lancejpollard@gmail.com"
  s.rubyforge_project = "html-schema"
  s.platform          = Gem::Platform::RUBY
  s.files             = %w(Rakefile) + Dir["{lib,rails,spec}/**/*"] - Dir["spec/tmp"]
  s.require_path      = "lib"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec    = spec
end

desc 'run unit tests'
task :test do
  Dir["test/**/*"].each do |file|
    next unless File.basename(file) =~ /test_/
    next unless File.extname(file) == ".rb"
    system "ruby #{file}"
  end
end

desc "Create .gemspec file (useful for github)"
task :gemspec do
  File.open("#{spec.name}.gemspec", "w") do |f|
    f.puts spec.to_ruby
  end
end

desc "Build the gem into the current directory"
task :gem => :gemspec do
  `gem build #{spec.name}.gemspec`
end

desc "Publish gem to rubygems"
task :publish => [:package] do
  %x[gem push #{spec.name}-#{spec.version}.gem]
end

desc "Print a list of the files to be put into the gem"
task :manifest do
  File.open("Manifest", "w") do |f|
    spec.files.each do |file|
      f.puts file
    end
  end
end

desc "Install the gem locally"
task :install => [:package] do
  File.mkdir("pkg") unless File.exists?("pkg")
  command = "gem install pkg/#{spec.name}-#{spec.version} --no-ri --no-rdoc"
  command = "sudo #{command}" if ENV["SUDO"] == true
  sh %{#{command}}
end

desc "Generate the rdoc"
Rake::RDocTask.new do |rdoc|
  files = ["README.md", "lib/**/*.rb"]
  rdoc.rdoc_files.add(files)
  rdoc.main = "README.md"
  rdoc.title = spec.summary
end

task :yank do
  `gem yank #{spec.name} -v #{spec.version}`
end
