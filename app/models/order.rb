class Order < ApplicationRecord
  validate  :validate_customer_id

  belongs_to :customer
  has_many :orderDetails
  has_many :payments

  enum status: { new_order: 0, processing: 1, packaged: 3,  part_dispatch: 4,
                all_dispatch: 5, finished: 6, cancelled:99 }

  def self.search(params = {})
    Order.joins(:customer)
    .joins("left join (select sum(order_details.total_amount) as sum_total_amount, order_details.order_id from
              order_details group by order_details.order_id) order_details on orders.id = order_details.order_id")
    .joins("left join (select sum(payments.amounts) as sum_amounts, payments.order_id from
              payments group by payments.order_id) payments on payments.order_id = orders.id")
    .select("orders.*, customers.name as customer_name, order_details.sum_total_amount, payments.sum_amounts")
    .where(create_conditions(params)).order({id: :desc})
  end

  # raise system exception
  def validate_customer_id
    Customer.find(customer_id) rescue errors.addraise SystemError
  end

end
