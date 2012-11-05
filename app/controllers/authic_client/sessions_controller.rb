module AuthicClient
  class SessionsController < ApplicationController
    def create
      user = User.find_for_authic_oauth(request.env["omniauth.auth"], current_user)
      if user.persisted?
        session[:authic_user_id] = user.id
        redirect_path ||= session[:authic_return_to_this_url] ||= root_url
        redirect_to redirect_path, :notice => "You have been successfully signed in"
      else
        redirect_to root_url  
      end
    end

    def destroy
      session[:authic_user_id] = nil
      redirect_path = "https://#{AuthicClient::AUTHIC_CLIENT_SUBDOMAIN}.authic.com/authic_sign_out?&return_path=#{URI.escape root_url}"
      redirect_to redirect_path
    end
  end
end