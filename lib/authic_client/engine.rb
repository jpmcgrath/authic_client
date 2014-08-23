module AuthicClient
  class Engine < ::Rails::Engine
    isolate_namespace AuthicClient

    initializer 'authic_client.app_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        include AuthicClient::ApplicationHelper
      end
    end
  end
end
