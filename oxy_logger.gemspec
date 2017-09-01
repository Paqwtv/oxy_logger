# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "oxy_logger/version"

Gem::Specification.new do |spec|
  spec.name          = "oxy_logger"
  spec.version       = OxyLogger::VERSION
<<<<<<< HEAD
  spec.authors       = ["Dima, Vitalik, Vlad"]
  spec.email         = ["paqwtv@gmail.com"]

  spec.summary       = %q{Ruby gem}
  spec.description   = %q{Gem for logging data}
=======
  spec.authors       = ["Vetal, Vlad, Dima"]
  spec.email         = ["paqwtv@gmail.com"]

  spec.summary       = %q{Gem, wich advise you an ability to write loggs}
  spec.description   = %q{Logger gem}
>>>>>>> origin/vlad_dev
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard", "~> 0.9.9"
end
