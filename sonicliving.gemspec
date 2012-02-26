# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sonicliving/version"

Gem::Specification.new do |s|
  s.name        = "sonicliving"
  s.version     = Sonicliving::VERSION
  s.authors     = ["MAJ"]
  s.email       = ["maj@notlistening.com"]
  s.homepage    = "http://www.github.com/maj/sonicliving"
  s.summary     = "Implements most of the Sonicliving API V2 in Ruby"
  s.description = "Allows you to get information from the Sonicliving API"

  s.rubyforge_project = "sonicliving"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "httparty"
  
end
