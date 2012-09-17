require 'test_helper'

class TestimonialsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
