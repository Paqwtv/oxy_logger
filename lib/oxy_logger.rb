require "oxy_logger/version"

module OxyLogger
  	@@files_path
	# @param value [String] - путь куда сохранять логи
	def self.files_path= value
		@@files_path = value
	end

	# @param bool [Boolean] - сохранение логов локально в файл
		@@save_to_file
	def self.save_to_file= bool
		@@save_to_file = bool
	end

		@@save_to_db
	# @param bool [Boolean] - сохранение логов в базу данных
	def self.save_to_db= bool
		@@save_to_db = bool
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

		@@current_user
	# @param bool [Bollean] - текущий пользователь
	def self.current_user= bool
		@@current_user = bool
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

	# Конфигурирует сам себя
	def self.configure
		yield self		
	end

	# @note метод, возвращающий настройки всего приложения после инициализации
	# @example
	# 	OxyLogger.config_oxy_hash
	# @return [Hash] 
	# 	OxyLogger.config_oxy_hash => {:files_path=>"~/projects/logger", :save_to_file=>true,
	# 	:save_to_db=>false, :incoming_params=>true, :output_params=>true, :processing_time=>true,
	# 	:current_user=>true, :date_time=>true, :called_method=>true, :class_name=>true}
	def self.config_oxy_hash
		{
			files_path: @@files_path,
			save_to_file: @@save_to_file,
			save_to_db: @@save_to_db,
			incoming_params: @@incoming_params,
			output_params: @@output_params,
			processing_time: @@processing_time,
			current_user: @@current_user,
			date_time: @@date_time,
			called_method: @@called_method,
			class_name: @@class_name
		}		
	end
end
