=begin
To include your task inside rails app you need add this to rails Rakefile:

spec = Gem::Specification.find_by_name 'oxy_logger'
load "#{spec.gem_dir}/lib/tasks/db_create.rake"
================================================
Type 'rake db_create' in terminal to run the task
================================================
=end
require 'rake'
namespace :oxy do
	desc "Task for create migration file from rails"
	task :db_create do
	 
		system 'rails g migration CreateLogger user:string run_time:datetime date_time:datetime class_name:string method_name:string result:string params:string'
	end
end