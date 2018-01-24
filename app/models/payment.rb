class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :customer

  def self.search(params = {})
    Payment.joins(:customer, :order).select("payments.*, customers.name as customer_name, orders.note as order_node")
      .where(create_conditions(params)).order({id: :desc})
  end
end
