class User < ApplicationRecord
  has_many :invoices
  has_secure_password
  validates_presence_of :password_digest, :role, :first_name, :last_name, :address, :city, :state, :zip
  validates :email, presence: true, uniqueness: true
end