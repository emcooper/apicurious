class Repository
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.find_all(user)
    github_service = GithubService.new(user)
    data = github_service.repositories
    data.map {|data| Repository.new(data)}
  end
end
