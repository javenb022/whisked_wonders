class Invoice < ApplicationRecord
  has_many :invoice_pies
  has_many :pies, through: :invoice_pies
  belongs_to :user
  validates_presence_of :completed, :status, :expected_delivery_time, :name, :delivery_method, :additional_info, :user_id
end