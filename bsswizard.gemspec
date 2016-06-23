# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bsswizard/version'

Gem::Specification.new do |spec|
  spec.name          = "bsswizard"
  spec.version       = BSSWizard::VERSION
  spec.authors       = ["Hans Dushanthakumar"]
  spec.email         = ["hans.dushanthakumar@amaysim.com.au"]

  spec.summary       = "BSS Wizard"
  spec.description   = "BSS Wizard"
  spec.homepage      = "http://www.amaysim.com.au"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "rest-client", "~> 1.6"
end
