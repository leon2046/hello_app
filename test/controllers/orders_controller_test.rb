require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    set_owner_user_id(Order)
    @order = orders(:one)
    @customer = customers(:one)
    Order.update_all(:customer_id => @customer.id)
    do_login
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: create_params }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: create_params }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  def create_params
    { customer_id: @customer.id, note: @order.note, status: @order.status }
  end
end
