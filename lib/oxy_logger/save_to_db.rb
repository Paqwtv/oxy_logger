require 'active_record'
require 'rails'

module OxyLogger
	module SaveToDb
	ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[ENV['RAILS_ENV']])
	
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