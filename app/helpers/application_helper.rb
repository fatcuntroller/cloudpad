module ApplicationHelper
  #current_user will be used for future refrence to logged in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
