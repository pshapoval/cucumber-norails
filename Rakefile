require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'active_record'
require 'active_record/fixtures'
require 'yaml'
require 'erb'

task :default => :features

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty" # Any valid command line option can go here.
end

desc "Load fixtures into the current database.  Load specific fixtures using FIXTURES=x,y"
task :fixtures => :environment do
  fixtures = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : Dir.glob(File.join(File.dirname(__FILE__), 'features', 'fixtures', '*.{yml,csv}'))
  fixtures.each do |fixture_file|
    ActiveRecord::Fixtures.create_fixtures('features/fixtures', File.basename(fixture_file, '.*'))
  end
end

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))
end