# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_interaction/active_job/version'

Gem::Specification.new do |spec|
  spec.name          = "active_interaction-active_job"
  spec.version       = ActiveInteraction::ActiveJob::VERSION
  spec.authors       = ["Anton Katunin"]
  spec.email         = ["antulik@gmail.com"]

  spec.summary       = %q{Add ActiveJob support to ActiveInteraction gem}
  spec.description   = %q{Add ActiveJob support to ActiveInteraction gem}
  spec.homepage      = "https://github.com/antulik/active_interaction-active_job"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activejob"
  spec.add_dependency "activesupport"
  spec.add_dependency "active_interaction"

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "rake", "~> 13.0.1"
end
