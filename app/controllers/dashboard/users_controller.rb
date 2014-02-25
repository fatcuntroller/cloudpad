class Dashboard::UsersController < DashboardController
  def dashboard
    if session[:user_id]
      @user = User.find(session[:user_id])
      @notes = @user.notes
    else
      redirect_to root_url
    end
  end
end
