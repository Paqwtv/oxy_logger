=begin
To include your task inside rails app you need add this to rails Rakefile:

spec = Gem::Specification.find_by_name 'oxy_logger'
load "#{spec.gem_dir}/lib/tasks/logger_install.rake"
================================================
Type 'rake oxy:logger_install' in terminal to run the task
================================================
=end
require 'rake'
	namespace :oxy do
		desc "Task for create migration file from rails"
		task :db_create do 
			system 'rails g migration CreateLogger user:string run_time:datetime date_time:datetime class_name:string method_name:string result:string params:string'
		end

		desc "Task for copy config file from gem to rails"
		task :cfg_copy do 
			cp(File.join(Gem.loaded_specs["oxy_logger"].full_gem_path,'config', 'logger_init.rb'), File.join(Rails.root,'config','initializers','logger_init.rb'))
		end

		desc 'logger_istall is a :db_create and :cfg_copy'
		task :logger_istall => [:db_create, :cfg_copy]
	end	