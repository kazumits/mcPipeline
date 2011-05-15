require 'test_helper'

class GadgetsControllerTest < ActionController::TestCase
  test "should get cluster" do
    get :cluster
    assert_response :success
  end

  test "should get queue" do
    get :queue
    assert_response :success
  end

end
