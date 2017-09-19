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
        if type == "ApplicationRecord"
        first_data[:type] = :model
        else
        first_data[:type] = :controller
        end
      first_data[:params] = first_data[:type] == :model ?
      first_data[:args] = args :
      first_data[:args] = params
      Writer.write(first_data)
    end

    def log_after method_name, *args

    end
  end

    @@files_path
  # @param value [String] - путь куда сохранять логи
  def self.files_path= value
    @@files_path = value
  end

  # @param value [String] - "file" or "db"
    @@save_to
  def self.save_to= value
    @@save_to = value
  end

    @@logget_fields
  def logget_fields= value
    @@logget_fields = value    
  end

  def self.path_to_log
    @@files_path
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
      save_to: @@save_to,
      logget_fields: @@logget_fields
    }
  end
end
