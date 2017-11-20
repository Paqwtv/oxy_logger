# OxyLogger

Welcome to our Rails logger gem!

This is a simple logger that is easy to use and can be configured as you want.

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'oxy_logger', '~> 0.3.0'
```

Then run:

    $ bundle install

## Usage

To include gem tasks inside your rails app.
Add this code to rails `Rakefile`:

```ruby
  spec = Gem::Specification.find_by_name 'oxy_logger'
  load "#{spec.gem_dir}/lib/tasks/logger_install.rake"
```

Then run the rake task.
This command will create a configuration file in your application and run the `migration` to update your database.

    $ rake oxy:install

## Controller or Model logging

In order to log the controller methods, add in `app/controllers/application_controller.rb`
Do the same code for the Model, if you need to log it `app/models/application_record.rb`

```ruby
  extend OxyLogger::Sys
  include OxyLogger::Helper
```

And at the end, specify what methods you want to use for logging.
IMPORTANT! The method `log_it` must be at the end of the logged methods.

```ruby
  logg_it [ :index, :show, :new, :edit, :create, :update, :destroy ] # Select any of the available methods
```

Very simple isn't?

## Configuration

When you launched the rake task a configuration file was copied into your project, which you can find at `/config/initializers/logger_init.rb`

```ruby
OxyLogger.configure do |config|
  # Save logs locally to a file or database
  config.save_to = "file"  # or config.save_to = "db"
```

If you want to log to a file, you can specify the path to it.
If this file does not exist, the **OxyLogger** will create it.

```ruby
  #  config.files_path = Rails.root + "/log/logged_data" # the same things in example 
  config.files_path = Rails.root.join('log', 'logged_data')
```

You can choose which parameters you want to record.
Unnecessary parameter just comment out or delete.

```ruby
  config.logget_fields = %i[
    date_time         # called time
    class_name        # class in which was called
    method_name       # method in which was called
    result            # return result
    params            # parameters
  ]
```

## Contributing

We will be very happy if our product interests you and you will have an irresistible desire to help us with its development.

https://github.com/[USERNAME]/oxy_logger.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
