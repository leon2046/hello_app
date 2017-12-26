class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderDetails
  has_many :payments

  def self.orders
    Order.joins(:customer).select("orders.*, customers.name as customer_name")
  end
end
