require 'rails'
require '../lib/oxy_logger'

# Default configure Logger GEM
OxyLogger.configure do |config|
	# @param value [String] - путь куда сохранять логи
	# @example
	#  config.files_path = "/home/logs"
  config.files_path = Rails.root.join('log', 'logged_data')
  # @note - сохранение логов локально в файл
  config.save_to_file = true
  # @note - сохранение логов в базу данных
	config.save_to_db = false
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
	# @note - вызываемый метод (экшн)
	config.called_method = true
	# @note - вызываемый класс
	config.class_name = true
end