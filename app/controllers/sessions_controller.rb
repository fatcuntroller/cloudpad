class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.from_omniauth(env["omniauth.auth"])  
    session[:user_id] = @user.id  
    redirect_to dashboard_root_url, notice: "Logged in!"
  end
  
  def destroy
    session[:user_id] = nil  
    redirect_to root_url, notice: "Signed out!"
  end
  
  def failure  
    redirect_to root_url, alert: "Authentication failed, please try again. Did you input correct password and email?"  
  end
end
