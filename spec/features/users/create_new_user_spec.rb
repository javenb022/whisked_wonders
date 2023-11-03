require "rails_helper"

RSpec.describe "Create new user", type: :feature do
  describe "Happy Path" do
    it "creates a new user" do
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Register New User")
      expect(page).to have_field("user_first_name")
      expect(page).to have_field("user_last_name")
      expect(page).to have_field("user_address")
      expect(page).to have_field("user_city")
      expect(page).to have_field("user_state")
      expect(page).to have_field("user_zip_code")
      expect(page).to have_field("user_email")
      expect(page).to have_field("user_password")
      expect(page).to have_field("user_password_confirmation")
      expect(page).to have_button("Create Account")

      fill_in "user_first_name", with: "John"
      fill_in "user_last_name", with: "Doe"
      fill_in "user_address", with: "123 Main St"
      fill_in "user_city", with: "Denver"
      fill_in "user_state", with: "CO"
      fill_in "user_zip_code", with: "80202"
      fill_in "user_email", with: "john@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Create Account"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, John Doe!")
    end
  end

  describe "Sad Path" do
    it "does not create a new user if any attribute is blank" do
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Register New User")
      expect(page).to have_field("user_first_name")
      expect(page).to have_field("user_last_name")
      expect(page).to have_field("user_address")
      expect(page).to have_field("user_city")
      expect(page).to have_field("user_state")
      expect(page).to have_field("user_zip_code")
      expect(page).to have_field("user_email")
      expect(page).to have_field("user_password")
      expect(page).to have_field("user_password_confirmation")
      expect(page).to have_button("Create Account")

      fill_in "user_first_name", with: "John"
      # fill_in "user_last_name", with: "Doe"
      fill_in "user_address", with: "123 Main St"
      fill_in "user_city", with: "Denver"
      fill_in "user_state", with: "CO"
      fill_in "user_zip_code", with: "80202"
      fill_in "user_email", with: "john@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Create Account"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("A problem occurred: Please fill in all fields.")
    end

    it "does not create a new user if email is not unique" do
      @user1 = User.create!(email: "john@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Register New User")
      expect(page).to have_field("user_first_name")
      expect(page).to have_field("user_last_name")
      expect(page).to have_field("user_address")
      expect(page).to have_field("user_city")
      expect(page).to have_field("user_state")
      expect(page).to have_field("user_zip_code")
      expect(page).to have_field("user_email")
      expect(page).to have_field("user_password")
      expect(page).to have_field("user_password_confirmation")
      expect(page).to have_button("Create Account")

      fill_in "user_first_name", with: "John"
      fill_in "user_last_name", with: "Doe"
      fill_in "user_address", with: "123 Main St"
      fill_in "user_city", with: "Denver"
      fill_in "user_state", with: "CO"
      fill_in "user_zip_code", with: "80202"
      fill_in "user_email", with: "john@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Create Account"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("That email already exists with an account.")
    end

    it "does not create a new user if password and password confirmation do not match" do
      visit new_user_path
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Register New User")
      expect(page).to have_field("user_first_name")
      expect(page).to have_field("user_last_name")
      expect(page).to have_field("user_address")
      expect(page).to have_field("user_city")
      expect(page).to have_field("user_state")
      expect(page).to have_field("user_zip_code")
      expect(page).to have_field("user_email")
      expect(page).to have_field("user_password")
      expect(page).to have_field("user_password_confirmation")
      expect(page).to have_button("Create Account")

      fill_in "user_first_name", with: "John"
      fill_in "user_last_name", with: "Doe"
      fill_in "user_address", with: "123 Main St"
      fill_in "user_city", with: "Denver"
      fill_in "user_state", with: "CO"
      fill_in "user_zip_code", with: "80202"
      fill_in "user_email", with: "john@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "wrongpassword"
      click_button "Create Account"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Passwords do not match.")
    end
  end
end