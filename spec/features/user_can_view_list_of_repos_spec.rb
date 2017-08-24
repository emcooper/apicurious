RSpec.feature "User clicks on repositories" do
  it "they see a list of repositories" do
    VCR.use_cassette("features/user_views_repos") do
      stub_omniauth
      visit root_path
      click_link "Login with Github"

      click_on "Repositories"
      expect(page).to have_css(".repo")
    end
  end
end
