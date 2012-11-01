module AuthicClient
  module ApplicationHelper
    
    def current_user
      @current_user ||= User.find(session[:authic_user_id]) if session[:authic_user_id]
    end

    def signin_path
      "/auth/authic?&state=sign_in"
    end

    def signup_path
      "/auth/authic?&state=sign_up"
    end

    def login_required
      unless current_user
        session[:authic_return_to_this_url] = request.fullpath
        redirect_to signin_path
      end
    end
  end
end
