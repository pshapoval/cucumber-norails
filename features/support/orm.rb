require 'active_record'
require 'yaml'

#DB config
db_config = YAML::load(File.open(File.expand_path('../../config/database.yml', File.dirname(__FILE__))))
ActiveRecord::Base.establish_connection(db_config)
ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))

class Test_table < ActiveRecord::Base

end