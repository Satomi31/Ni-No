require "test_helper"

class Admin::PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_phone_numbers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_phone_numbers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_phone_numbers_edit_url
    assert_response :success
  end
end
