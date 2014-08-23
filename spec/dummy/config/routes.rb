Rails.application.routes.draw do
  mount AuthicClient::Engine => "/authic_client"
end
