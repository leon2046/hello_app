module CustomersHelper
  def list_customers_for_combobox
    Customer.where({
      :owner_user_id => @current_user.id
      })
  end
end
