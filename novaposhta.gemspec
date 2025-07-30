# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'novaposhta/version'

Gem::Specification.new do |spec|
  spec.name          = 'novaposhta'
  spec.version       = Novaposhta::VERSION
  spec.authors       = ['nerzh']
  spec.email         = ['emptystamp@gmail.com']

  spec.summary       = 'This is gem nova poshta (Новая почта, Нова пошта)'
  spec.description   = 'Gem API NOVA POSHTA(Новая почта, Нова пошта) for all ruby projects'
  spec.homepage      = 'https://github.com/nerzh/novaposhta'
  spec.license       = 'MIT'

  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.files         = Dir['lib/**/*']
  spec.bindir        = 'bin'
  spec.executables   = ['novaposhta']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'activesupport'
  spec.add_runtime_dependency     'nokogiri'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rubocop'
end
