require "rails_helper"

RSpec.describe InvoicePie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:invoice_id) }
    it { should validate_presence_of(:pie_id) }
    it { should validate_presence_of(:toppings) }
  end

  describe "relationships" do
    it { should belong_to(:invoice) }
    it { should belong_to(:pie) }
  end
end