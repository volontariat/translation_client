$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'translation_client/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'translation_client'
  s.version     = TranslationClient::VERSION
  s.authors     = ['Mathias Gawlista']
  s.email       = ['gawlista@gmail.com']
  s.homepage    = 'http://Volontari.at'
  s.summary     = 'Multi-tenant translator in-place or in backend with option to fork other translations or request crowdsourcing platforms.'
  s.description = 'Isolated multi-tenant Ruby on Rails engine to manage translations in the database in-place or in a backend with option to fork other translation databases or to request translations from a Crowdsourcing platform like Volontari.at'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.0'

  s.add_development_dependency 'home_page'
  s.add_development_dependency 'mysql2'
end