class Pie < ApplicationRecord
  has_many :invoice_pies
  has_many :invoices, through: :invoice_pies
  validates_presence_of :name, :description, :price, :estimated_time
  validates_numericality_of :price
end