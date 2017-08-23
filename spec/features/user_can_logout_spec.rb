RSpec.feature "User clicks log out" do
  it "they are logged out and redirected to root" do
    VCR.use_cassette("features/user_can_logout") do
      stub_omniauth
      visit root_path
      click_link "Login with Github"

      click_on "Log Out"
      expect(page).to_not have_content("Ellen Cooper")
      expect(page).to have_link("Login with Github")
      expect(current_path).to eq(root_path)
    end
  end
end
