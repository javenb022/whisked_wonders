require "rails_helper"

RSpec.describe "NavBarRoutes", type: :feature do
  describe "NavBar Routes" do
    it "should route to the home page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_link("Home", href: root_path)
      end
    end

    it "should route to the Shop page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_link("Shop", href: shop_path)
      end

      click_link("Shop")
      expect(current_path).to eq(shop_path)
    end

    it "should route to the About page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_link("About", href: about_path)
      end

      click_link("About")
      expect(current_path).to eq(about_path)
    end

    it "should route to the Reviews page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_link("Reviews", href: reviews_path)
      end

      click_link("Reviews")
      expect(current_path).to eq(reviews_path)
    end

    it "should route to the Contact page" do
      visit root_path

      expect(current_path).to eq(root_path)
      within("nav") do
        expect(page).to have_link("Contact", href: contact_path)
      end

      click_link("Contact")
      expect(current_path).to eq(contact_path)
    end
  end
end