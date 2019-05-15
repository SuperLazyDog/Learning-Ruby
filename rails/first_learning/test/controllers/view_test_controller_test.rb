require 'test_helper'

class ViewTestControllerTest < ActionDispatch::IntegrationTest
  test "should get t1" do
    get view_test_t1_url
    assert_response :success
  end

  test "should get t2" do
    get view_test_t2_url
    assert_response :success
  end

  test "should get t3" do
    get view_test_t3_url
    assert_response :success
  end

  test "should get t4" do
    get view_test_t4_url
    assert_response :success
  end

  test "should get t5" do
    get view_test_t5_url
    assert_response :success
  end

  test "should get t6" do
    get view_test_t6_url
    assert_response :success
  end

end
