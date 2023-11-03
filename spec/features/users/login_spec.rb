require "rails_helper"

RSpec.describe "LoginLogout", type: :feature do
  describe "Login and Logout" do
    describe "Happy Path" do
      it "has a login button on the navbar when not logged in" do
        visit root_path

        expect(current_path).to eq(root_path)
        within("nav") do
          expect(page).to have_button("Login")
          expect(page).to_not have_button("Logout")
        end
      end

      it "takes you to the login page when you click the login button" do
        visit root_path

        expect(current_path).to eq(root_path)
        within("nav") do
          expect(page).to have_button("Login")
          expect(page).to_not have_button("Logout")
        end

        click_button("Login")
        expect(current_path).to eq(login_path)

        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_button("Sign In")

        expect(page).to have_button("Create an Account")
      end

      it "has a logout button on the navbar when logged in" do
        @user1 = User.create!(email: "user1@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
        visit root_path

        expect(current_path).to eq(root_path)

        click_button("Login")
        fill_in "email", with: "#{@user1.email}"
        fill_in "password", with: "#{@user1.password}"
        click_button("Sign In")

        expect(current_path).to eq(root_path)
        within("nav") do
          expect(page).to have_button("Logout")
          expect(page).to_not have_button("Login")
        end
      end
    end

    describe "Sad Path" do
      it "raises an error if the email is not found" do
        visit login_path

        expect(current_path).to eq(login_path)

        fill_in "email", with: "notanemail"
        fill_in "password", with: "password"
        click_button("Sign In")

        expect(current_path).to eq(login_path)
        expect(page).to have_content("A problem occurred: Email or password is incorrect.")
      end

      it "raises an error if the password is incorrect" do
        @user1 = User.create!(email: "user1@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
        visit login_path

        expect(current_path).to eq(login_path)

        fill_in "email", with: "#{@user1.email}"
        fill_in "password", with: "wrongpassword"
        click_button("Sign In")

        expect(current_path).to eq(login_path)
        expect(page).to have_content("A problem occurred: Email or password is incorrect.")
      end

      it "raises an error if the email is blank" do
        @user1 = User.create!(email: "user1@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
        visit login_path

        expect(current_path).to eq(login_path)

        # fill_in "email", with: "#{@user1.email}"
        fill_in "password", with: "#{@user1.password}"
        click_button("Sign In")

        expect(current_path).to eq(login_path)
        expect(page).to have_content("A problem occurred: Email or password is incorrect.")
      end

      it "raises an error if the password is blank" do
        @user1 = User.create!(email: "user1@email.com", password: "password", first_name: "User", last_name: "1", address: "123 Main", city: "Denver", state: "CO", zip_code: "80202")
        visit login_path

        expect(current_path).to eq(login_path)

        fill_in "email", with: "#{@user1.email}"
        # fill_in "password", with: "#{@user1.password}"
        click_button("Sign In")

        expect(current_path).to eq(login_path)
        expect(page).to have_content("A problem occurred: Email or password is incorrect.")
      end
    end
  end
end