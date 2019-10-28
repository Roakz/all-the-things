require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_index_url
    assert_response :success
  end

  test "should get new" do
    get shop_new_url
    assert_response :success
  end

  test "should get create" do
    get shop_create_url
    assert_response :success
  end

  test "should get edit" do
    get shop_edit_url
    assert_response :success
  end

  test "should get update" do
    get shop_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_destroy_url
    assert_response :success
  end

end
