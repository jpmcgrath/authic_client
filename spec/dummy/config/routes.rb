Dummy::Application.routes.draw do

  mount AuthicClient::Engine => "/authic"

  get "welcome/index"
  root :to => "welcome#index"

end
