require "test_helper"

class BorrowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get borrows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get borrows_destroy_url
    assert_response :success
  end
end
