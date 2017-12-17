require 'test_helper' #调用test——helper里的函数


class MerchantTest < ActiveSupport::TestCase
   def setup
       @merchant=Merchant.create(:name => "商家" , :address => "我是商家地址", :introduce => "我是商家介绍" )
   end
   
   test "should be valid" do 
     assert  @merchant
   end
   
   test "should not save merchant without name" do   
      merchant=Merchant.new
      assert_not merchant.save, "Saved the merchant without a name"
   end
   
   test "merchant should not be nil" do   
     assert_not_nil  @merchant
   end
   
   test "name should not be nil" do  
     assert_not_nil  @merchant.name
   end
   
  
   test "address should not be nil" do    
     assert_not_nil  @merchant.address
   end
   
   test "introduce should not be nil" do      
     assert_not_nil  @merchant.introduce
   end
   
   test "name should not be empty"do
     assert_not_empty @merchant.name
   end
   
   test "address should not be empty"do
     assert_not_empty @merchant.address
   end
   
   test "introduce should not be empty"do
     assert_not_empty @merchant.introduce
   end
   
   
   
   test "the truth" do   
      assert true
    end

end