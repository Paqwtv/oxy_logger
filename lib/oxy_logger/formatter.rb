require "/home/project1/gem/oxy_logger/lib/oxy_logger/logrecord"

module OxyLogger
    module Formatter

    	@@save_to_file_or_db
      


        def self.formatter_to log
             if  @@save_to_file_or_db == "file"
                log[:save_to] = "file"
                LogRecord.parser(log)
             elsif @@save_to_file_or_db == "db"
           	    log[:save_to] = "db"
             end
             
    	end
    end
end
