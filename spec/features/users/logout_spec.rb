require "rails_helper"

RSpec.describe "Logout", type: :feature do
  describe "User can logout" do
    describe "Happy Path" do
      it "logs out the user" do
        user = User.create!(email: "user1@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
        visit login_path
        fill_in "email", with: "#{user.email}"
        fill_in "password", with: "#{user.password}"
        click_button("Sign In")

        expect(current_path).to eq(root_path)

        click_button("Logout")
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Successfully logged out")
        expect(page).to have_button("Login")
        expect(page).to_not have_button("Logout")
      end
    end
  end
end