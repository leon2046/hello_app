class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  def self.list_orders
    Order.joins(:customer).select("orders.*, customers.name as customer_name")
  end
end
