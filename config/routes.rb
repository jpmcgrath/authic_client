Rails.application.routes.draw do
  match "/auth/authic/callback" => "authic::sessions#create"
  match "/signout" => "authic::sessions#destroy", :as => "signout"
end