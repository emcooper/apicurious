class UsersController < ApplicationController

  def show
    @user_dashboard = UserDashboard.new(current_user)
  end
end
