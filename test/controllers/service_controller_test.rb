require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get show_all" do
    get :show_all
    assert_response :success
  end

  test "should get show_category" do
    get :show_category
    assert_response :success
  end

  test "should get show_time" do
    get :show_time
    assert_response :success
  end

  test "should get show_event_post" do
    get :show_event_post
    assert_response :success
  end

end
