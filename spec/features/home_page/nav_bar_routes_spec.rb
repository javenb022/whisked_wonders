require "rails_helper"

RSpec.describe "NavBarRoutes", type: :feature do
  describe "NavBar Routes" do
    it "should route to the home page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_button("Home")
      end
    end

    it "should route to the Shop page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_button("Shop")
      end

      click_button("Shop")
      expect(current_path).to eq(shop_path)
    end

    it "should route to the About page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_button("About")
      end

      click_button("About")
      expect(current_path).to eq(about_path)
    end

    it "should route to the Reviews page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_button("Reviews")
      end

      click_button("Reviews")
      expect(current_path).to eq(reviews_path)
    end

    it "should route to the Contact page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_button("Contact")
      end

      click_button("Contact")
      expect(current_path).to eq(contact_path)
    end
  end
end