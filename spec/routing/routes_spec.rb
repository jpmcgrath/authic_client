require 'rails_helper'

module AuthicClient
  describe "Routes" do
    routes { AuthicClient::Engine.routes }

    it 'routes signout get' do
      expect(get: 'signout').to route_to(controller: "authic_client/sessions", action: "destroy")
    end

    it 'routes signout get' do
      expect(delete: 'signout').to route_to(controller: "authic_client/sessions", action: "destroy")
    end

    it "routes authic callback" do
      expect(get: "auth/authic/callback").to route_to(
        controller: "authic_client/sessions",
        action: "create"
      )
    end
  end
end