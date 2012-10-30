Rails.application.routes.draw do
  scope :module  => 'AuthicClient' do
    match "/auth/authic/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => "signout"
  end
end