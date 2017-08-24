class UsersController < ApplicationController

  def show
    @user_profile = UserProfile.new(current_user)
  end
end
