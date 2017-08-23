class UserDashboard
  attr_reader :num_followers,
              :num_following,
              :profile_picture,
              :num_starred_repos,
              :recent_activity

  def initialize(user)
    github_service = GithubService.new(user)
    @num_followers = github_service.num_followers
    @num_following = github_service.num_following
    @num_starred_repos = github_service.num_starred_repos
    @profile_picture = github_service.profile_picture
    @recent_activity = github_service.recent_activity
  end
end
