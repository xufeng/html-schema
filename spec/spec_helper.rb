require 'rubygems'
require 'bundler/setup'
require 'active_support/core_ext'
require 'rspec'

# spec spec/microdata/base_spec.rb

RSpec.configure do |config|
  
end

$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'html-schema'
