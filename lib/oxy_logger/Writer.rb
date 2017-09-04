require 'rails'
require 'active_record'

module OxyLogger
	module Writer

		def self.save_to_file text
			File.open("text.txt" , "a") do  |f|
			    f.print("#{text}\n")
		    end

		end
		    ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env])
	
			class LogDb < ActiveRecord::Base
			end

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