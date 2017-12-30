class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :good, :foreign_key => :id, :primary_key => :good_id

  enum order_status: {
     new_order: 0, stocking: 1, stocked: 3, dispatch:4, cancelled: 99
  }

  def self.search(params = {})
    conditions = nil
    params.each do |key, val|
      if conditions.present?
        conditions = conditions.and(arel_table[key].eq(val)) if !val.empty?
      else
        conditions = arel_table[key].eq(val) if !val.empty?
      end
    end
    OrderDetail.joins(:good).select("order_details.*, goods.name_cn, goods.name_jp").where(conditions)
    .order({order_id: :desc}, {id: :desc})
  end
end
