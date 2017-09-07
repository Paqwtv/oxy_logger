require 'rails'
require 'active_record'
require_relative "formatter"
require_relative "log_record"

module OxyLogger
	module Writer
		def self.write first_data
			data = OxyLogger::Formatter.format_data first_data
			puts ">> data #{data}"
			record = OxyLogger::LogRecord.new data
			puts ">> data #{record.inspect}"
			record.save_to == :db ?
				save_to_db(record.for_db) :
				save_to_file(record.file_name, record.for_file)
		end

		def self.save_to_file file_name, text
			path = [OxyLogger.path_to_log, file_name].join('/')
			if Dir.glob(OxyLogger.path_to_log, File::FNM_CASEFOLD) == false #check for existing dir, if dir isn't exists, it will be created
			Dir.mkdir(OxyLogger.path_to_log)
			end
			File.open(path, "a") do  |f|
			    f.print("#{text}\n")
		    end

		end
		    ActiveRecord::Base.establish_connection( 
		    	  adapter: "sqlite3",
 					  pool: "5",
            timeout: "5000",
            database: "db/development.sqlite3" )

			class LogDb < ActiveRecord::Base
			end

		def self.save_to_db data	
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