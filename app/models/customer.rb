class Customer < ApplicationRecord
  validates :name, length: {maximum: 255}, presence: true
  validates :snsid, length: {maximum: 255}
  validates :note, length: {maximum: 255}

  has_many :orders
  has_many :payments

end
