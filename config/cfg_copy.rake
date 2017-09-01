require 'fileutils'
	
		desc "Task for move config file from gem to rails"
		task :cfg_copy do
			cp(File.join('config', 'spring.rb'), File.join('db','spring.rb'), :verbose => true)
		end
