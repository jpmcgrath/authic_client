AuthicClient::Engine.routes.draw do
  get   '/auth/authic/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy', as: 'signout', via: [:get, :delete]
end