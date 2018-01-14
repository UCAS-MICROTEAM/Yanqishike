require 'test_helper'

class BannersControllerTest < ActionController::TestCase
   
  def setup
    @banner=Banner,new(banner_params)
  end
end
        
class BannerControllerTest < ActionDispatch::IntegrationTest
  test "should get http" do
    get banners_path
    assert_response :redirect
    #assert_redirected_to :action => "login"

    #assert_equal "Please log in", flash[:notice]
  end
  
  def test_index_without_user

    get banners_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:warning]
  end
  
  def test_index_with_user

    get banners_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:success]
  end

   test "the truth" do
     assert true
   end
   
   test "update is success"do
    get banners_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:info]
  end
       
   
   
  
end
