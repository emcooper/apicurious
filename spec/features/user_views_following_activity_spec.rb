RSpec.feature "User clicks on following" do
  it "they see a summary of activity of people they follow" do
    VCR.use_cassette("features/user_views_following") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path
      click_on "Following"

      expect(page).to have_css(".name")
      expect(page).to have_css(".commit-message")
      expect(page).to have_css(".commit-repo")
    end
  end
end
