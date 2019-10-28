require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get dynamic_pages_user_url
    assert_response :success
  end

end
