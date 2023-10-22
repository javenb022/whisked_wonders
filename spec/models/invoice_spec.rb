require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:user_id) }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many :invoice_pies }
    it { should have_many(:pies).through(:invoice_pies) }
  end
end