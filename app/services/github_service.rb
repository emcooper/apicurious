class GithubService < ApplicationController
  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get(url, default_params)
    JSON.parse(response.body, symbolize_names: :true)
  end

  def default_params
    {
      client_id: ENV["github-key"],
      client_secret: ENV["github-secret"]
    }
  end

  def num_followers
    data = get_url("/users/#{@user.username}")
    data[:followers]
  end

  def num_following
    data = get_url("/users/#{@user.username}")
    data[:following]
  end

  def num_starred_repos
    data = get_url("/users/#{@user.username}/starred")
    data.count
  end

  def profile_picture
    data = get_url("/users/#{@user.username}")
    data[:avatar_url]
  end

  def recent_activity
    data = get_url("/search/commits?q=committer-name:#{@user.username}")
  end
end