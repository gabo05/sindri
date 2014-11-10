require 'test_helper'

class BusinessControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
