require "oxy_logger/version"
require "oxy_logger/writer"

module OxyLogger
  module Sys
    def logg_it my_names
      my_names.each do |my_name|
      method_hook( my_name, :before => :log_befor )
      method_hook( my_name, :after => :log_after )
      end
    end
  end

  module Helper
    def log_befor method_name, *args
        first_data = {}
        type = self.class.superclass.to_s
        first_data[:start] = DateTime.now
      first_data[:name] = method_name
      first_data[:class_name] = self.class.name
      puts "1>>>>>>>>"
      if type == "ApplicationRecord"
        first_data[:type] = :model
      else
        first_data[:type] = :controller
      end
      puts "2>>>>>>>>"
      first_data[:params] = first_data[:type] == :model ?
        first_data[:args] = args.inspect :
        first_data[:args] = params
      
      puts first_data
      # # записать лог
      OxyLogger::Writer.write first_data
    end

    def log_after method_name, *args
      puts method_name
      puts args.inspect
      #     data = DataGetter.получить пост данные
      #     data = Formatter.format_data first_data
      # # записать лог
      #     Writer.write data

    end
  end

    @@files_path
  # @param value [String] - путь куда сохранять логи
  def self.files_path= value
    @@files_path = value
  end

  # @param value [String] - "file" or "db"
    @@save_to_file_or_db
  def self.save_to_file_or_db= value
    @@save_to_file_or_db = value
  end

    @@incoming_params
  # @param bool [Bollean] - входящие параметры
  def self.incoming_params= bool
    @@incoming_params = bool
  end

    @@output_params
  # @param bool [Bollean] - исходящие параметры
  def self.output_params= bool
    @@output_params = bool
  end

    @@processing_time
  # @param bool [Bollean] - время обработки запроса
  def self.processing_time= bool
    @@processing_time = bool
  end

  # @param bool [Bollean] - дата и время
    @@date_time
  def self.date_time= bool
    @@date_time = bool
  end

  # @param bool [Bollean] - вызываемый метод (экшн)
     @@called_method
  def self.called_method= bool
    @@called_method = bool
  end

  # @param bool [Bollean] - вызываемый класс
     @@class_name
   def self.class_name= bool
     @@class_name = bool
   end
  
  @@rails_app
   def self.rails_app= app
     @@rails_app = app
   end

  # Конфигурирует сам себя
  def self.configure
    yield self    
  end

  # @note метод, возвращающий настройки всего приложения после инициализации
  # @example
  #   OxyLogger.config_oxy_hash
  # @return [Hash] 
  #   OxyLogger.config_oxy_hash => {:files_path=>"~/projects/logger", :save_to_file_or_db=>"file",
  #   :incoming_params=>true, :output_params=>true, :processing_time=>true,
  #   :date_time=>true, :called_method=>true, :class_name=>true}
  def self.config_oxy_hash
    {
      files_path: @@files_path,
      save_to: @@save_to_file_or_db,
      incoming_params: @@incoming_params,
      output_params: @@output_params,
      processing_time: @@processing_time,
      date_time: @@date_time,
      called_method: @@called_method,
      class_name: @@class_name
    }
  end

  def self.path_to_log
    @@files_path
  end
end
