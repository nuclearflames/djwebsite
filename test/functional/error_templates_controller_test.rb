require 'test_helper'

class ErrorTemplatesControllerTest < ActionController::TestCase
  test "should get error_404" do
    get :error_404
    assert_response :success
  end

end
