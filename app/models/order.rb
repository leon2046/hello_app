class Order < ApplicationRecord
  has_many :orderDetails
end
