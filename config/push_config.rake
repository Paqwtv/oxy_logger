require 'fileutils'
	module config
		desc "Task for move config file from gem to rails"
		task (:сfg_copy) do |сfg_copy|
		FileUtils.copy_file("config/logger_init.rb", "#{RAILS_ROOT}/config/initializers/logger_init.rb")
		end
	end
