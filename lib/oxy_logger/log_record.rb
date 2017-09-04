  
module OxyLogger
	class LogRecord 
    def initialize data
      @data = data
    end
		
    def save_to
      @data[:save_to]
    end 
         
    def for_db
      @data.except(:save_to, :type)
    end

    def file_name
      @data[:class_name] + ".log"
    end

    def for_file
      # parse template
      str = "LogRecord for #{@data[:type]}"
      for_db.map{|k, v| str += "#{k} :  #{v}"}
      str
    end
		
	end
end

