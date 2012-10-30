module AuthicClient
  class SessionsController < ApplicationController
    def create
      user = User.find_for_authic_oauth(request.env["omniauth.auth"], current_user)
      if user.persisted?
        session[:user_id] = user.id
        redirect_path ||= session[:return_to_this_url] ||= root_url
        redirect_to redirect_path, :notice => "You have been successfully signed in"
      else
        redirect_to root_url  
      end
    end

    def destroy
      session[:user_id] = nil
      #TODO: Change to PROD url
      redirect_path = "http://#{$authic_client_subdomain}.authicstaging.com/authic_sign_out?&return_path=#{URI.escape root_url}"
      redirect_to redirect_path
    end
  end
end