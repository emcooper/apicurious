RSpec.feature "User visits profile page" do
  it "they see the organizations they belong to" do
    VCR.use_cassette("features/user_visits_profile") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_content("Organization")
    end
  end
  it "they see their recent commits" do
    VCR.use_cassette("features/user_visits_profile") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_css(".commit-message")
      expect(page).to have_css(".commit-repo")
    end
  end
  it "they see their number of starred repos, followers, and following" do
    VCR.use_cassette("features/user_visits_profile") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_content("Following")
      expect(page).to have_content("Followers")
      expect(page).to have_content("Starred")
    end
  end
end
