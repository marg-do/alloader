# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alloader/version'

Gem::Specification.new do |spec|
  spec.name          = "alloader"
  spec.version       = Alloader::VERSION
  spec.authors       = ["marg_do"]
  spec.email         = ["domargdo@gmail.com"]
  spec.summary       = %q{Load or Require all files in the folder.}
  spec.description   = %q{Load or Require all files in the folder.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
