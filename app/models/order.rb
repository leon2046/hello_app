class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderDetails
  has_many :payments

  enum status: { new_order: 0, processing: 1, packaged: 3,  part_dispatch: 4,
                all_dispatch: 5, finished: 6, cancelled:9 }
                
  def self.orders
    Order.joins(:customer).select("orders.*, customers.name as customer_name")
  end
end
