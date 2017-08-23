class UserDashboard
  attr_reader :num_followers,
              :num_following,
              :profile_picture,
              :num_starred_repos,
              :recent_activity

  def initialize(attributes)
    @num_followers = attributes[:followers]
    @num_following = attributes[:following]
    @num_starred_repos = attributes[:num_starred_repos]
    @profile_picture = attributes[:avatar_url]
    @recent_activity = attributes[:recent_activity]
  end
end
