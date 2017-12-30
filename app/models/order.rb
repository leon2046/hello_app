class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderDetails
  has_many :payments

  enum status: { new_order: 0, processing: 1, packaged: 3,  part_dispatch: 4,
                all_dispatch: 5, finished: 6, cancelled:99 }

  def self.search(params = {})
    conditions = nil
    params.each do |key, val|
      if conditions.present?
        conditions = conditions.and(arel_table[key].eq(val)) if !val.empty?
      else
        conditions = arel_table[key].eq(val) if !val.empty?
      end
    end
    Order.joins(:customer).select("orders.*, customers.name as customer_name").where(conditions).order({id: :desc})
  end

  def self.select_options
    Order.all.order(id: :desc)
  end
end
