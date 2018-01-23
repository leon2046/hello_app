module OrdersHelper
  def default_order_note_suffix(customer = nil)
    (customer.nil? ? "" : customer.name) + I18n.t('orders.index.customer_order') + Time.now.strftime('%Y%m%d')
  end
end
