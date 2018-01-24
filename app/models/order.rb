class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderDetails
  has_many :payments

  enum status: { new_order: 0, processing: 1, packaged: 3,  part_dispatch: 4,
                all_dispatch: 5, finished: 6, cancelled:99 }

  def self.search(params = {})
    Order.joins(:customer)
    .left_joins(:orderDetails).group("order_details.order_id")
    .select("orders.*, customers.name as customer_name, sum(order_details.total_amount) as total_amount")
    .where(create_conditions(params)).order({id: :desc})
  end

  def self.select_options
    Order.all.order(id: :desc)
  end
end
