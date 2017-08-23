RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth
    visit root_path

    expect(page).to have_link("Login with Github")

    click_link "Login with Github"

    expect(page).to have_content("Ellen Cooper")
    expect(page).to have_link("Logout")
  end
end
