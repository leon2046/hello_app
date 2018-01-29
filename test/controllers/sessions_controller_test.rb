require 'test_helper'


class SessionsControllerTest < ActionDispatch::IntegrationTest
  # include LoginHelper

  test "should be login" do
      do_login
      assert_redirected_to orders_path
  end

  test "should be not login" do
      user = {:account => "erwrw@test.com"}
      do_login(user)
      assert_response :success
      assert_not_nil flash[:danger]
  end

  test "should get lgoin" do
    get login_path
    assert_response :success
  end

end
