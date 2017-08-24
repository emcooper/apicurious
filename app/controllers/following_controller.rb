class FollowingController < ApplicationController
  def index
    @following = Following.find_all(current_user)
  end
end
