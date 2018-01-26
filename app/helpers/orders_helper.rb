module OrdersHelper
  def default_order_note_suffix_helper(customer = nil)
    (customer.nil? ? "" : customer.name) + I18n.t('orders.index.customer_order_suffix') + Time.now.strftime('%Y%m%d')
  end

  def list_order_details(order)
    order.orderDetails.search({
      :owner_user_id => @current_user.id
      })
  end

  def list_orders_for_combobox
    Order.where({
      :owner_user_id => @current_user.id
      }).order(id: :desc)
  end
end
