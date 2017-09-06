=begin
To include your task inside rails app you need add this to rails Rakefile:

spec = Gem::Specification.find_by_name 'oxy_logger'
load "#{spec.gem_dir}/lib/tasks/cfg_copy.rake"
================================================
Type 'rake cfg_copy' in terminal to run the task
================================================
=end
require 'rake'
  desc "Task for copy config file from gem to rails"
  task :cfg_copy do 
    cp(File.join(Gem.loaded_specs["oxy_logger"].full_gem_path,'config', 'logger_init.rb'), File.join(Rails.root,'config','initializers','logger_init.rb'), :verbose => true)
end
