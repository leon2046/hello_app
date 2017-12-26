class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :good, :foreign_key => :id, :primary_key => :good_id

  def self.order_details
    OrderDetail.joins(:good).select("order_details.*, goods.name_cn, goods.name_jp")
  end
end
