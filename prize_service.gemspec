# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prize_service/version'

Gem::Specification.new do |spec|
  spec.name          = "prize_service"
  spec.version       = PrizeService::VERSION
  spec.authors       = ["Kibreab"]
  spec.email         = ["kibreab@eagle-eyes4designs.com"]
  spec.description   = %q{This is a simple task that supplies information about prize service of a customer}
  spec.summary       = %q{prize service information of a customer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["Rakefile", "lib/prize_service.rb", "lib/prize_service/eligibility.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #spec.add_development_dependency "bundler", "~> 1.3"
  #spec.add_development_dependency "rake"
end
