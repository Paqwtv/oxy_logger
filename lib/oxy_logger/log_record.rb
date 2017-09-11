require "mustache"
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
      template_data = OxyLogger.config_oxy_hash.merge!(@data)
      Mustache.template_file = "#{__dir__}/template.mustache"
      str = Mustache.render(template_data)
      str
    end

  end
end

