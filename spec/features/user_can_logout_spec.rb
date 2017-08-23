RSpec.feature "User clicks log out" do
  xit "they are logged out and redirected to root" do

    visit '/'
    click_on "Log Out"
    expect(page).to_not have_content(user.name)
    expect(page).to have_content("Login with Github")
    expect(current_path).to eq(root)
  end
end
