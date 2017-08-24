describe GithubService do
  before :each do
    user = create(:user)
    @ghs = GithubService.new(user)
  end

  it "num_followers returns the number of followers" do
    VCR.use_cassette("services/num_followers") do
      followers = @ghs.num_followers

      expect(followers).to be_a(Integer)
    end
  end

  it "num_following returns the number following" do
    VCR.use_cassette("services/num_following") do
      num_following = @ghs.num_following

      expect(num_following).to be_a(Integer)
    end
  end

  it "num_starred_repos returns the number of starred repos" do
    VCR.use_cassette("services/num_starred_repos") do
      num_starred_repos = @ghs.num_starred_repos

      expect(num_starred_repos).to be_a(Integer)
    end
  end

  it "profile_picture returns the url for the profile picture" do
    VCR.use_cassette("services/profile_picture") do
      profile_picture = @ghs.profile_picture

      expect(profile_picture).to be_a(String)
    end
  end

  it "profile_picture returns the url for the profile picture" do
    VCR.use_cassette("services/profile_picture") do
      profile_picture = @ghs.profile_picture

      expect(profile_picture).to be_a(String)
    end
  end

  it "recent_activity returns an array of recent activity" do
    VCR.use_cassette("services/recent_activity") do
      recent_activity = @ghs.recent_activity

      expect(recent_activity).to be_a(Array)
      expect(recent_activity.first[:message]).to be_a(String)
      expect(recent_activity.last[:repo]).to be_a(String)
    end
  end

  it "repositories returns an array of repo names" do
    VCR.use_cassette("services/repositories") do
      repositories = @ghs.repositories

      expect(repositories).to be_a(Array)
      expect(repositories.first).to be_a(String)
      expect(repositories.last).to be_a(String)
    end
  end

  it "organizations returns an array of organizations" do
    VCR.use_cassette("services/organizations") do
      organizations = @ghs.organizations

      expect(organizations).to be_a(Array)
    end
  end

  it "following returns an array of people the user follows" do
    VCR.use_cassette("services/following") do
      following = @ghs.following

      expect(following).to be_a(Array)
      expect(following.first[:name]).to be_a(String)
      expect(following.last[:recent_activity]).to be_a(Array)
      expect(following.last[:recent_activity].first[:message]).to be_a(String)
      expect(following.last[:recent_activity].first[:repo]).to be_a(String)
    end
  end
end
