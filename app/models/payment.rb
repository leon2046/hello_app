class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :customer

  def self.payments
    Payment.joins(:customer, :order).select("payments.*, customers.name as customer_name, orders.note as order_node")
  end

  def self.search(params = {})
    conditions = nil
    params.each do |key, val|
      if conditions.present?
        conditions = conditions.and(arel_table[key].eq(val)) if !val.empty?
      else
        conditions = arel_table[key].eq(val) if !val.empty?
      end
    end
    Payment.joins(:customer, :order).select("payments.*, customers.name as customer_name, orders.note as order_node").where(conditions)
  end
end
