module AuthicClient
  module ApplicationHelper
    
    def current_user
      @current_user ||= ::User.find(session[:authic_user_id]) if session[:authic_user_id]
    end

    def signin_path
      "/auth/authic?&authic_action=signin"
    end

    def signup_path
      "/auth/authic?&authic_action=signup"
    end
    
    def signin_iframe_path
      "#{AuthicClient::AUTHIC_CLIENT_FULL_URL}/v1/signin_iframe"
    end

    def user_account_path
      "#{AuthicClient::AUTHIC_CLIENT_FULL_URL}/edit_account"
    end

    def login_required
      unless current_user
        session[:authic_return_to_this_url] = request.fullpath
        redirect_to signin_path
      end
    end
  end
end
