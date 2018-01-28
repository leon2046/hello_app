class OrderDetail < ApplicationRecord
  validates :good_id, numericality: {only_integer: true}, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}, presence: true
  validates :purchase_price, numericality: {greater_than: 0}, presence: true
  validates :selling_price, numericality: {greater_than: 0}, presence: true
  validates :total_amount, numericality: {greater_than: 0}, presence: true
  validates :order_note, length: {maximum: 255}, presence: false
  validate  :validate_order_id
  validate  :validate_good_id


  belongs_to :order
  has_one :good, :foreign_key => :id, :primary_key => :good_id

  enum order_status: {
     new_order: 0, stocking: 1, stocked: 3, dispatch:4, cancelled: 99
  }

  def self.search(params = {})
    OrderDetail.joins(:good, :order).select("order_details.*, orders.note, goods.name_cn, goods.name_jp")
    .where(create_conditions(params))
  end

  # raise system exception
  def validate_good_id
    Good.find(good_id) rescue raise SystemError
  end

  # raise system exception
  def validate_order_id
    Order.find(order_id) rescue raise SystemError
  end

end
