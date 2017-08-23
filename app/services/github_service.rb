class GithubService < ApplicationController
  def initialize(user)
    @user = user
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: :true)
  end

  def num_followers
    data = get_url("https://api.github.com/users/#{@user.username}?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    data[:followers]
  end

  def num_following
    data = get_url("https://api.github.com/users/#{@user.username}?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    data[:following]
  end

  def num_starred_repos
    data = get_url("https://api.github.com/users/#{@user.username}/starred?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    data.count
  end

  def profile_picture
    data = get_url("https://api.github.com/users/#{@user.username}?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    data[:avatar_url]
  end

  def recent_activity
    data = get_url("https://api.github.com/users/#{@user.username}/events?client_id=#{ENV["github-key"]}&client_secret=#{ENV["github-secret"]}")
    #format
  end
end
