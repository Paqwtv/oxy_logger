module OxyLogger
<<<<<<< HEAD
	module Formatter
     	def self.format_data first_data
     		data = {}
		  data[:run_time] = first_data[:work_time]
		  data[:date_time] = first_data[:start]
		  data[:class_name] = first_data[:class_name]
		  data[:method_name] = first_data[:name]
		  data[:result] = first_data[:result]
		  data[:params] = first_data[:params]
		  data[:type] = first_data[:type]
		  data[:save_to] = OxyLogger.config_oxy_hash[:save_to].to_sym
		  data
     	end
=======
  module Formatter
       def self.format_data first_data
         data = {}
      data[:run_time]    = first_data[:work_time]
      data[:date_time]    = first_data[:start]
      data[:class_name]    = first_data[:class_name]
      data[:method_name]  = first_data[:name]
      data[:result]      = first_data[:result]
      data[:params]      = first_data[:params]
      data[:type]      = first_data[:type]
      data[:save_to]        = OxyLogger.config_oxy_hash[:save_to].to_sym
      data
       end
>>>>>>> cca95ab142885f4bf8974a5c251f9e2a5340ee7b
     end
 end

 # c=Card.new
 # c.my_fun_meth "Hello"