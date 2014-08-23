require 'omniauth'
require 'omniauth-authic'

module AuthicClient
  class Engine < ::Rails::Engine
    isolate_namespace AuthicClient

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
