require 'active_record'
if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
	ActiveRecord::Base.establish_connection(YAML::load(IO.read('db/config.yml'))[ENV["RACK_ENV"] || 'development'])
end
ActiveRecord::Base.logger = Logger.new(STDOUT)
