# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skype_chat/version'

Gem::Specification.new do |spec|
  spec.name          = "skype_chat"
  spec.version       = SkypeChat::VERSION
  spec.authors       = ["jewelve"]
  spec.email         = ["xiedajeeling@gmail.com"]
  spec.description   = %q{Skype with command line interface}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'skype'
  spec.add_dependency 'rb-appscript' if RUBY_PLATFORM =~ /darwin/i
  spec.add_dependency 'ruby-dbus' if RUBY_PLATFORM =~ /linux/i
  spec.add_dependency 'term-ansicolor'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
