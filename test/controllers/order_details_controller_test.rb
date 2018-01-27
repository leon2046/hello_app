require 'test_helper'

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    set_owner_user_id(OrderDetail)
    set_owner_user_id(Order)
    set_owner_user_id(Good)
    @order = Order.first
    @customer = Customer.first
    @good = Good.first
    @order_detail = order_details(:one)
    Order.update_all(:customer_id => @customer.id)
    OrderDetail.update_all(:order_id => @order.id, :good_id => goods(:one).id)
    do_login
  end

  test "should get index" do
    get order_details_url
    assert_response :success
  end

  test "should get new" do
    get new_order_detail_url
    assert_response :success
  end

  test "should create order_detail" do
    assert_difference('OrderDetail.count') do
      post order_details_url, params: { order_detail: crate_params }
    end

    assert_redirected_to order_detail_url(OrderDetail.last)
  end

  test "should show order_detail" do
    get order_detail_url(@order_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_detail_url(@order_detail)
    assert_response :success
  end

  test "should update order_detail" do
    patch order_detail_url(@order_detail), params: { order_detail: crate_params }
    assert_redirected_to order_detail_url(@order_detail)
  end

  test "should destroy order_detail" do
    assert_difference('OrderDetail.count', -1) do
      delete order_detail_url(@order_detail)
    end

    assert_redirected_to order_details_url
  end

  def crate_params
    { order_id: @order.id,
          good_id: @good.id, order_time: @order_detail.order_time,
          quantity: @order_detail.quantity, purchase_price: @order_detail.purchase_price,
          selling_price: @order_detail.selling_price, total_amount: @order_detail.total_amount,
          order_status: @order_detail.order_status, order_note: @order_detail.order_note }
  end
end
