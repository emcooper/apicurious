RSpec.feature "User visits profile page" do
  it "they see the organizations they belong to" do
    VCR.use_cassette("features/user_visits_profile") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_content("Organization")
    end
  end
end
