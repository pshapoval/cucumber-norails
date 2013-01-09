require 'database_cleaner'
require 'active_record'
require 'active_record/fixtures'

Before do
  begin
    #Clean DB
    DatabaseCleaner.clean_with :truncation

    #Load fixtures
    ActiveRecord::Fixtures.reset_cache
    fixtures_folder = File.join(File.dirname(__FILE__), '../fixtures')
    fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
    ActiveRecord::Fixtures.create_fixtures(fixtures_folder, fixtures)
  rescue Exception => e
    puts "Hooks Before Error: #{e}"
  end
end