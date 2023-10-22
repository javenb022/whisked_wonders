require "rails_helper"

RSpec.describe Pie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:estimated_time) }
  end

  describe "relationships" do
    it {should have_many :invoice_pies}
    it { should have_many(:invoices).through(:invoice_pies) }
  end
end