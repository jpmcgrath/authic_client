Rails.application.routes.draw do
  match "/auth/authic/callback" => "authic_client::sessions#create"
  match "/signout" => "authic_client::sessions#destroy", :as => "signout"
end