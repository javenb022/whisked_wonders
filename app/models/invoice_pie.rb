class InvoicePie < ApplicationRecord
  belongs_to :pie
  belongs_to :invoice
  validates_presence_of :quantity, :invoice_id, :pie_id, :toppings
end