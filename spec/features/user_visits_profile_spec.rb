RSpec.feature "User visits profile page" do
  it "they see the organizations they belong to" do
    VCR.use_cassette("features/user_visits_profile") do
      stub_omniauth
      visit root_path
      click_link "Login with Github"
      visit profile_path

      expect(page).to have_css(".organization")
    end
  end
end
