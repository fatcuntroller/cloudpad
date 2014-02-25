class DashboardController < ApplicationController
  before_action {redirect_to root_url unless session[:user_id]}
end