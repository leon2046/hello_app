class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :good, :foreign_key => :id, :primary_key => :good_id
end
