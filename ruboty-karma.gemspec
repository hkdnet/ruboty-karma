# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/karma/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-karma'
  spec.version       = Ruboty::Karma::VERSION
  spec.authors       = ['hkdnet']
  spec.email         = ['hkdnet@users.noreply.github.com']

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = Dir['{test/**/*}']
  spec.summary       = "manage members' karma"
  spec.homepage      = 'https://github.com/hkdnet/ruboty-karma'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']
  spec.add_dependency 'ruboty'
  spec.add_development_dependency 'bundler', ">= 2.1"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-power_assert'
end
