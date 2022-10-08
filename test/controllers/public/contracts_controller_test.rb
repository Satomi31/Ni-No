require "test_helper"

class Public::ContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_contracts_new_url
    assert_response :success
  end

  test "should get index" do
    get public_contracts_index_url
    assert_response :success
  end
end
