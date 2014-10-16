Rails.application.routes.draw do
  get 'auth/authic/callback' => 'authic/sessions#create'
  match 'signout' => 'authic/sessions#destroy', as: 'signout', via: [:get, :delete]
end