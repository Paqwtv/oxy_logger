require 'rails'
require '../lib/oxy_logger'

# Default configure Logger GEM
OxyLogger.configure do |config|
	# @param value [String] - путь куда сохранять логи
	# @example
	#  config.files_path = Rails.root + "/log/logged_data" #the same things in example 
  config.files_path = Rails.root.join('log', 'logged_data')
  # @note - сохранение логов локально в файл или в базу данных
  # @param value [String] - "file" or "db"
  # @example
  #  config.save_to_file_of_db = "db"
  config.save_to_file_or_db = "file"
	# @note - входящие параметры
	config.incoming_params = true
	# @note - исходящие параметры
	config.output_params = true
	# @note - время обработки запроса
	config.processing_time = true
	# @note - текущий пользователь
	config.current_user = true
	# @note - дата и время
	config.date_time = true
	# @note - вызываемый метод (action)
	config.called_method = true
	# @note - вызываемый класс
	config.class_name = true
end