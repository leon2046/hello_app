class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :good, :foreign_key => :id, :primary_key => :good_id

  enum order_status: {
     new_order: 0, stocking: 1, stocked: 3, cancelled: 9
  }

  def self.order_details
    OrderDetail.joins(:good).select("order_details.*, goods.name_cn, goods.name_jp")
  end
end
