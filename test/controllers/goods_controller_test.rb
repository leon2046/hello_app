require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    set_owner_user_id(Good)
    @good = goods(:one)
    do_login
  end

  test "should get index" do
    get goods_url
    assert_response :success
  end

  test "should get new" do
    get new_good_url
    assert_response :success
  end

  test "should create good" do
    assert_difference('Good.count') do
      post goods_url, params: { good: create_params }
    end

    assert_redirected_to good_url(Good.last)
  end

  test "should show good" do
    get good_url(@good)
    assert_response :success
  end

  test "should get edit" do
    get edit_good_url(@good)
    assert_response :success
  end

  test "should update good" do
    patch good_url(@good), params: { good: create_params }
    assert_redirected_to good_url(@good)
  end

  test "should destroy good" do
    assert_difference('Good.count', -1) do
      delete good_url(@good)
    end

    assert_redirected_to goods_url
  end

  def create_params
    { image_path: @good.image_path, jan_cd: @good.jan_cd, name_cn: @good.name_cn,
      name_jp: @good.name_jp, price_jpy: @good.price_jpy, profit_rate: @good.profit_rate,
      selling_price_cny: @good.selling_price_cny }
  end
end
