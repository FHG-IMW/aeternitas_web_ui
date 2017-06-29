$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aeternitas/web_ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aeternitas_web_ui"
  s.version     = Aeternitas::WebUi::VERSION
  s.authors     = ["DarthMax"]
  s.email       = ["max@kopfueber.org"]
  s.homepage    = "https://github.com/FHG-IWM/aeternitas"
  s.summary     = "Monitoring UI for Æternitas"
  s.description = "Monitoring UI for Æternitas"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_dependency 'aeternitas'
  s.add_dependency 'colorable'
  s.add_dependency 'sass-rails'
  s.add_dependency 'jbuilder'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'sqlite3'
end
