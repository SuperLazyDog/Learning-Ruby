require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get 1" do
    get test_1_url
    assert_response :success
  end

  test "should get 2" do
    get test_2_url
    assert_response :success
  end

  test "should get 3" do
    get test_3_url
    assert_response :success
  end

  test "should get 4" do
    get test_4_url
    assert_response :success
  end

  test "should get 5" do
    get test_5_url
    assert_response :success
  end

end
