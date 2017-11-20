require 'rails'
require 'oxy_logger'

class Object
  def self.method_hook(*args)
    options = args.extract_options!
    return unless (options[:before].present? or options[:after].present?)
    args.each do |method_name|
      old_method = instance_method(method_name) rescue next

      define_method(method_name) do |*args|
        # invoke before callback
        if options[:before].present?
          options[:before].is_a?(Proc) ? options[:before].call(method_name, self):
            send(options[:before], method_name, *args)
        end

        # you can modify the code to call after callback
        # only when the old method returns true etc..
        old_method.bind(self).call(*args)

        # invoke after callback
        if options[:after].present?
          options[:after].is_a?(Proc) ? options[:after].call(method_name, self):
            send(options[:after], method_name, *args)
        end
      end
    end
  end
end

# Default configure Logger GEM
OxyLogger.configure do |config|
  # @note - Save logs locally to a file or database
  # @param value [String] - "file" or "db"
  # @example
  #  config.save_to = "db"
  config.save_to = 'file'
  # @param value [String] - way to save logs
  # @example
  #  config.files_path = Rails.root + "/log/logged_data" #the same things in example 
  config.files_path = Rails.root.join('log', 'logged_data')
  # @note - logged parameters
  config.logget_fields = %i[
    run_time
    date_time
    class_name
    method_name
    result
    params
  ]
end
