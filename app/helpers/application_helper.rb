module ApplicationHelper
  #current_user will be used for future refrence to logged in user
  private
    def current_user
      if session[:user_id] 
        @current_user ||= User.find(session[:user_id])
      end
    end
end
