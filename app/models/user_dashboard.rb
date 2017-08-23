class UserDashboard
  attr_reader :num_followers,
              :num_following,
              :profile_picture,
              :num_starred_repos,
              :recent_activity

  def initialize
    @num_followers = GithubService.num_followers
    @num_following = GithubService.num_following
    @num_starred_repos = GithubService.num_starred_repos
    @profile_picture = GithubService.profile_picture
    @recent_activity = GithubService.recent_activity
  end
end
