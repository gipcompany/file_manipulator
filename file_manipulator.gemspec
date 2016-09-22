# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_manipulator/version'

Gem::Specification.new do |spec|
  spec.name          = "file_manipulator"
  spec.version       = FileManipulator::VERSION
  spec.authors       = ["Atsushi Ishida"]
  spec.email         = ["gipcompany@gmail.com"]

  spec.summary       = %q{Manipulate Files}
  spec.description   = %q{Manipulate (Split/Merge) Files}
  spec.homepage      = "https://github.com/gipcompany/file_manipulator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
end
