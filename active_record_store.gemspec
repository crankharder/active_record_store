# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_store/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_store"
  spec.version       = ActiveRecordStore::VERSION
  spec.authors       = ["Josh Sharpe"]
  spec.email         = ["josh.m.sharpe@gmail.com"]
  spec.description   = %q{Key/Vale Store in AR}
  spec.summary       = %q{Seriously, don't use this crap.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end

