require "bundler/gem_tasks"
require "rspec/core/rake_task"
import "lib/tasks/cfg_copy.rake"
import "lib/tasks/db_create.rake"
import "lib/tasks/logger_istall.rake"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
