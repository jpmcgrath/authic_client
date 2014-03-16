Rails.application.routes.draw do
  get "/auth/authic/callback" => "authic/sessions#create"
  get "/signout" => "authic/sessions#destroy", :as => "signout"
end