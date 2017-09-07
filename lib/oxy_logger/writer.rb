require 'rails'
require 'active_record'
require_relative "formatter"
require_relative "log_record"

module OxyLogger
<<<<<<< HEAD
	module Writer
		def self.write first_data
			data = Formatter.format_data(first_data)
			puts ">> data #{data}"
			record = LogRecord.new(data)
			puts ">> data #{record.inspect}"
			record.save_to == :db ?
				save_to_db(record.for_db) :
				save_to_file(record.file_name, record.for_file)
		end
=======
  module Writer
    def self.write first_data
      data = OxyLogger::Formatter.format_data(first_data)
      puts ">> data #{data}"
      record = OxyLogger::LogRecord.new data
      puts ">> data #{record.inspect}"
      record.save_to == :db ?
        save_to_db(record.for_db) :
        save_to_file(record.file_name, record.for_file)
    end
>>>>>>> cca95ab142885f4bf8974a5c251f9e2a5340ee7b

    def self.save_to_file file_name, text
      path = [OxyLogger.path_to_log, file_name].join('/')
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

<<<<<<< HEAD
		def self.save_to_db	data
		   LogDb.create do |log|
			log.run_time = data[:run_time]
			log.class_name = data[:class_name]
			log.date_time = data[:date_time]
			log.method_name = data[:method_name]
			log.result = data[:result]
			log.params = data[:params]
		   end
	    end
=======
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
>>>>>>> cca95ab142885f4bf8974a5c251f9e2a5340ee7b

    end
end