class UsersController < ApplicationController

  def show
    response = Faraday.get("https://api.github.com/users/#{current_user.username}")
    attributes = JSON.parse(response.body, symbolize_names: :true)
    starred_repos = Faraday.get("https://api.github.com/users/#{current_user.username}/starred")
    num_starred_repos = JSON.parse(starred_repos.body).count
    attributes[:num_starred_repos] = num_starred_repos
    @user = User.new(attributes)
  end
end
