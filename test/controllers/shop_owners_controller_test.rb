require 'test_helper'

class ShopOwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shop_owners_new_url
    assert_response :success
  end

  test "should get create" do
    get shop_owners_create_url
    assert_response :success
  end

end
