RSpec.feature "User clicks on following" do
  it "they see a summary of activity of people they follow" do
    VCR.use_cassette("features/user_views_following") do
      stub_omniauth
      visit root_path
      click_link "Login with Github"
      visit profile_path
      click_on "Following"

      expect(page).to have_css(".name")
      expect(page).to have_css(".activity-summary")
    end
  end
end
