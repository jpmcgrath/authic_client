module AuthicClient
  module ApplicationHelper
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def signin_path
      "/auth/authic?&state=sign_in"
    end

    def signup_path
      "/auth/authic?&state=sign_up"
    end

    def login_required
      unless current_user
        session[:return_to_this_url] = request.full_path
        redirect_to signin_path
      end
    end
  end
end
