class UsersController < ApplicationController

  def show
    response = Faraday.get("https://api.github.com/users/#{current_user.username}?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    attributes = JSON.parse(response.body, symbolize_names: :true)
    starred_repos = Faraday.get("https://api.github.com/users/#{current_user.username}/starred?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    attributes[:num_starred_repos] = JSON.parse(starred_repos.body).count
    recent_commits = Faraday.get("https://api.github.com/users/#{current_user.username}/events?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    attributes[:recent_activity] = JSON.parse(recent_commits.body)
    @user_dashboard = UserDashboard.new(attributes)
  end
end
