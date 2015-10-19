$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "search_settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "search_settings"
  s.version     = SearchSettings::VERSION
  s.authors     = ["Gryphon"]
  s.email       = ["mail@grigor.io"]
  s.homepage    = "TODO"
  s.summary     = "Search Settings for tables with filter"
  s.description = "Allows to customize search tables with Ransack and Simple Form"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "devise", "~> 3.4.0"
  s.add_dependency "kaminari", "~> 0.15.0"
  s.add_dependency "simple_form", "~> 3.1.0"
  s.add_dependency "ransack", "~> 1.6.0"
  s.add_dependency "haml-rails"
  s.add_dependency "coffee-rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'database_cleaner'

  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'bootstrap-sass', "~>3.1.1"
  s.add_development_dependency 'jquery-rails'

  s.test_files = Dir["spec/**/*"]

end
