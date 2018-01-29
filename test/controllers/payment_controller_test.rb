require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  setup do
    set_owner_user_id(Payment)
    set_owner_user_id(Order)
    set_owner_user_id(Customer)

    @order = Order.first
    @customer = Customer.first
    Order.update_all(customer_id: @customer.id)
    Payment.update_all(order_id: @order.id)
    @payment = payments(:one)

    do_login
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url, params: { order_id: @order.id, customer_id: @customer.id}
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: create_params }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: create_params }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end

  def create_params
    { order_id: @order.id, customer_id: @customer.id, amounts: @payment.amounts,
        payment_method: @payment.payment_method, note: @payment.note }
  end
end
