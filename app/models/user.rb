class User < ApplicationRecord
  has_secure_password
  validates :account, presence: true
  validates :password, presence: true
end
