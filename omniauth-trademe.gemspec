# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-trademe/version"

# p OmniAuth::Trademe::VERSION
Gem::Specification.new do |s|
  s.name        = "omniauth-trademe"
  s.version     = OmniAuth::Trademe::VERSION
  s.authors     = ["Eaden McKee"]
  s.email       = ["eadz@eadz.co.nz"]
  s.homepage    = "https://github.com/eadz/omniauth-trademe"
  s.summary     = %q{OmniAuth strategy for Trademe}
  s.description = %q{OmniAuth strategy for Trademe}

  s.rubyforge_project = "omniauth-trademe"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'  
end