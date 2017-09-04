require 'rails'
require 'active_record'
require "formatter"
require "log_record"

module OxyLogger
	module Writer
		def write first_data
			data   = OxyLogger::Formatter.format_data first_data
			puts ">> data #{data}"
			record = OxyLogger::LogRecord.new data
			puts ">> data #{record.inspect}"
			record.save_to == :db ?
				save_to_db   record.for_db :
				save_to_file record.file_name, record.for_file
		end
	
	private 
		def self.save_to_file file_name, text
			path = [OxyLogger.path_to_log, file_name].join('/')
			File.open(path, "a") do  |f|
			    f.print("#{text}\n")
		    end

		end
		    ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env])
	
			class LogDb < ActiveRecord::Base
			end

		def save_to_db data	
		   LogDb.create do |log|
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