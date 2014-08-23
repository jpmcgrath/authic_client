class AuthicClient::SessionsController < ActionController::Base
  def create
    user = User.find_for_authic_oauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
      session[:authic_user_id] = user.id
      redirect_path ||= session[:authic_return_to_this_url] ||= root_url
      # make sure the return to session variable is nil so it cant accidently get re-used
      session[:authic_return_to_this_url] = nil 
      redirect_to redirect_path, :notice => "You have been successfully signed in"
    else
      redirect_to root_url  
    end
  end

  def destroy
    reset_session
    redirect_path = "#{AuthicClient::AUTHIC_CLIENT_FULL_URL}/authic_sign_out?&return_path=#{URI.escape root_url}"
    redirect_to redirect_path
  end
end