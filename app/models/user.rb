class User < ApplicationRecord
  has_many :invoices
  has_secure_password
  validates_presence_of :user_name, :password_digest, :role
end