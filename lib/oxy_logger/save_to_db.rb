require 'active_record'
require 'sqlite3'

module OxyLogger
	module SaveToDb
	ActiveRecord::Base.establish_connection(
	  :adapter  => 'sqlite3',
	  :database => '/home/hurum/projects/lesson_13/db/development.sqlite3',
		:host => 'localhost')
			# adapter: postgresql,
			# encoding: unicode,
			# database: hurum_db,
			# pool: 2,
			# username: postgres_hurum,
			# password: 'password',
			# host: localhost)
			# если у вас не настроен postgresql
			# :adapter => 'sqlite3',
			# :database => '/db/development.sqlite3')
			#ActiveRecord::Base.logger = Logger.new(STDERR) # ошибки работы БД

# migration
# ActiveRecord::Schema.class_eval do

# create_table :log_dbs do |t|
# t.text :user
# t.text :run_time
# t.text :class_name
# t.text :date_time
# t.text :method_name
# t.text :result
# t.text :params

# t.timestamps
# end
# end

class LogDb < ActiveRecord::Base
end

	# @param data [Hash] - принимает данные от module Writer
	# @example
	#  data = {:user => "Хурум", :class_name => "base", :run_time => "00.23ms", :date_time => "08.09.2017", :method_name => "index", :result => "23", :params => "text"}
	def save_to_db data	
		LogDb.create do |log|
			log.user = data[:user]
			log.run_time = data[:run_time]
			log.class_name = data[:class_name]
			log.date_time = data[:date_time]
			log.method_name = data[:method_name]
			log.result = data[:result]
			log.params = data[:params]
		end
	end
end
end