# encoding: utf-8
require File.expand_path("../lib/ganexa/version", __FILE__)

Gem::Specification.new do |s|
    s.name = "ganexa"
    s.version = Ganexa::VERSION
    s.authors = ["Dayvson Lima"]
    s.email = ["dayvsonlima31@gmail.com"]
    s.homepage = "https://github.com/dayvsonlima/ganexa"
    s.summary = %q{}
    s.description = %q{}
    s.licenses = ['']
    s.files = `git ls-files`.split("\n")
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ['lib']

    s.add_runtime_dependency 'thor', '~> 0.19'
    s.add_runtime_dependency 'sinatra'

    s.add_development_dependency 'rspec', '~> 3'
end
