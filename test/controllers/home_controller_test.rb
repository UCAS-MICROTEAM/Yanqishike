require 'test_helper'

#class HomeControllerTest < ActionController::TestCase
class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_session_url
    assert_response :success
  end
  
  
  test "the truth" do
     assert true
  end
  
  def test_index_without_user
    get user_session_url
    assert_response :success
  end
  
  
  
  
  
  
end


