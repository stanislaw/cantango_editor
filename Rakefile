# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end


task :default => :test

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cantango_editor"
  gem.homepage = "http://github.com/stanislaw/cantango_editor"
  gem.license = "MIT"
  gem.summary = "Rails Engine to manage permissions stored in yaml file"
  gem.description = "Admin Web UI to manage permissions - Who can do What on Which objects" 
  gem.email = "s.pankevich@gmail.com"
  gem.authors = ["stanislaw"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
