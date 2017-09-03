module OxyLogger
	module LogRecord 
      
		def self.parser log
	         if  log[:save_to] == "file"
			     parse_log  = "пользователь: #{log[:user]}  имя класса: #{log[:class_name]}  время выполнения: #{log[:run_time]} время и дата: #{log[:date_time]} название метода: #{log[:method_name]} результат: #{log[:result]} параметры: #{log[:params]} "
			     SaveToFile.save_to_file(parse_log)  
			 elsif log[:save_to] == "db"
			       puts "я не буду работать с этим"      
	        end
		end
		
	end
end

