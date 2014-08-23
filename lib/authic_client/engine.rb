module AuthicClient
  class Engine < ::Rails::Engine
    isolate_namespace AuthicClient

    config.to_prepare do
      ApplicationController.helper(AuthicClient::ApplicationHelper)
    end
  end
end
