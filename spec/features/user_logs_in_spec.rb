RSpec.feature "user logs in" do
  scenario "using github oauth" do
    VCR.use_cassette("features/user_logs_in") do
      stub_omniauth
      visit root_path

      expect(page).to have_link("Login with Github")

      click_link "Login with Github"

      expect(page).to have_content("Ellen Cooper")
      expect(page).to have_link("Log Out")
    end
  end
end
