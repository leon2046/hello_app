class Payment < ApplicationRecord
  # belongs_to :order
  belongs_to :customer

  def self.payments
    Payment.joins(:customer).select("payments.*, customers.name as customer_name")
  end

end
