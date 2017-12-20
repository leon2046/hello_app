require 'test_helper'

class RakutenControllerTest < ActionDispatch::IntegrationTest
  test "should get query" do
    get rakuten_query_url
    assert_response :success
  end

end
