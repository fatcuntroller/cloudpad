class DashboardController < ApplicationController
  before_action :set_user
    

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_url
    end
  end
end