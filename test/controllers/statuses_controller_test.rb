require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
   
  def setup
    @status = Status.new
    @status.content = params["content"]
    @status.user = current_user
    @merchant_name = params["merchant_name"]
    @food_name =  params["food_name"]
  end
end

class StatusControllerTest < ActionDispatch::IntegrationTest
  test "should get http" do
    get statuses_path
    assert_response :redirect
    #assert_redirected_to :action => "login"

    #assert_equal "Please log in", flash[:notice]
  end
  
  
   test "the truth" do
     assert true
   end
   
   def test_index_without_user

    get statuses_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:warning]
   end
   
   def test_index_with_user

    get statuses_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:success]
   end

   def test_true
     assert true
   end
   
   test "update is success"do
    get statuses_url
    assert_redirected_to user_session_url

    assert_equal nil, flash[:info]
   end

end