require 'fileutils'
	
		desc "Task for move config file from gem to rails"
		task :cfg_copy do
			cp(File.join(Gem.loaded_specs["oxy_logger"].full_gem_path,'config', 'logger_init.rb'), File.join(Rails.root,'config','initializers','logger_init.rb'), :verbose => true)
		end
