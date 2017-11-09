require 'mustache'

module OxyLogger
  class LogRecord
    def initialize(data)
      @data = data
    end
    
    def save_to
      @data[:save_to]
    end 
         
    def for_db
      @data.except(:save_to, :type)
    end

    def file_name
      @data[:class_name] + '.log'
    end

    def for_file
      text = @data.slice(OxyLogger.logget_data)
      Mustache.template_file = "#{__dir__}/template.mustache"
      str = Mustache.render(@data)
      str
    end
  end
end
