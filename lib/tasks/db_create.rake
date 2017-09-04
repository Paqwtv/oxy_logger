
require 'rake'
	desc "Task for create migration file from  rails"
	task :db_create do 
		system 'ruby -v'
		system 'rails g migration  logger user:string run_time:datetime  date_time:datetime class_name:string  method_name:string result:string params:string'
end

