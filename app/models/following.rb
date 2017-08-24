class Following
  attr_reader :name,
              :recent_activity

 def initialize(data)
   @name = data[:name]
   @recent_activity = data[:recent_activity]
 end

 def self.find_all(user)
   github_service = GithubService.new(user)
   data = github_service.following
   data.map {|data| Following.new(data)}
 end

end
