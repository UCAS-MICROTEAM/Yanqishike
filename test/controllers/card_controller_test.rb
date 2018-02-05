require 'test_helper'

class CardsControllerTest < ActionController::TestCase
   
  def setup
    @card=Card.new(card_params)
  end
end

class CardControllerTest < ActionDispatch::IntegrationTest
  test "should get http" do
    get cards_path
    assert_response :redirect
    #assert_redirected_to :action => "login"

    #assert_equal "Please log in", flash[:notice]
  end
  
  
   test "the truth" do
     assert true
   end
   
   def test_index_without_user

    get cards_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:warning]
   end
   
   def test_index_with_user

    get cards_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:success]
   end

   def test_true
     assert true
   end
   
   test "update is success"do
    get cards_url
    assert_redirected_to user_session_url

    assert_equal nil, flash[:info]
  end

end