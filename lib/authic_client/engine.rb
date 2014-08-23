require 'omniauth'
require 'omniauth-authic'

module AuthicClient
  class Engine < ::Rails::Engine
    isolate_namespace AuthicClient
    initializer 'authic_client.app_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        include AuthicClient::ApplicationHelper
      end
    end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
