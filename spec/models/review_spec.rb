require "rails_helper"

RSpec.describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:review) }
  end
end