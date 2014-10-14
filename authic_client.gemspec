$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authic_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authic_client"
  s.version     = AuthicClient::VERSION
  s.authors     = ["authic"]
  s.email       = ["support@authic.com"]
  s.homepage    = "http://github.com/authic/authic_client"
  s.summary     = "Turn your Rails app into an Authic client"
  s.description = "This gem will handle the integration of your app with the Authic service"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.2.5"
  s.add_dependency "omniauth-authic"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
end
