
module OxyLogger
	module LogRecord 
		include OxyLogger::Writer
         save_to_file_or_db = "db"
         
         def db_or_file log
      	      if save_to_file_or_db == "file"
                data = "пользователь: #{log[:user]}  имя класса: #{log[:class_name]}  время выполнения: #{log[:run_time]} время и дата: #{log[:date_time]} название метода: #{log[:method_name]} результат: #{log[:result]} параметры: #{log[:params]} "
                save_to_file data
              elsif save_to_file_or_db == "db"
              	save_to_db log
              end
		 end
		
	end
end

