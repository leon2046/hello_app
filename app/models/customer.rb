class Customer < ApplicationRecord
  has_many :orders
  has_many :payments
end
