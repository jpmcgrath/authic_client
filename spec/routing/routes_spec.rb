require 'rails_helper'

describe "Routes" do
  routes { Dummy::Application.routes }

  it 'routes signout' do
    expect(get: 'signout').to route_to(
      controller: "authic_client/sessions",
      action: "destroy"
    )
  end

  it "routes authic callback" do
    expect(get: "auth/authic/callback").to route_to(
      controller: "authic_client/sessions",
      action: "create"
    )

    expect(post: "auth/authic/callback").to route_to(
      controller: "authic_client/sessions",
      action: "create"
    )
  end

  it 'routes welcome index' do
    expect(get: '/').to route_to(
      controller: 'welcome',
      action: 'index'
    )
  end
end