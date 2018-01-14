require 'test_helper'

#class HomeControllerTest < ActionController::TestCase
class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end
end


