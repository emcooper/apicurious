RSpec.feature "User clicks on repositories" do
  it "they see a list of repositories" do
    VCR.use_cassette("features/user_views_repos") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit profile_path
      
      click_on "Repositories"
      expect(page).to have_css(".repo")
    end
  end
end
