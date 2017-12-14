require 'test_helper' #调用test——helper里的函数


class BannerTest < ActiveSupport::TestCase
   def setup
      @banner = Banner.new(content: "picture1", image: "image1", url: "url1")
   end
   
   test "the truth" do   
      assert true
    end

   
   test "should be valid" do #测试banner是否存在
     assert  @banner
   end
   
   test "should not save banner without content" do   #测试banner是否有content
      banner = Banner.new
      assert_not banner.save, "Saved the banner without a content"
   end
   
   test "banner should not be nil" do   #测试banner不为nil
     assert_not_nil  @banner
   end
   
   test "content should not be nil" do  #测试content不为nil
     assert_not_nil  @banner.content
   end
   
   test "image should not be nil" do    #测试image不为nil
     assert_not_nil  @banner.image
   end
   
   test "url should not be nil" do      #测试url不为nil
     assert_not_nil  @banner.url
   end
   
   test "content should not be too long" do  
     @banner.content = "a" * 51
     assert @banner
   end
   
   test "content should not be empty"do
     assert_not_empty @banner.content
   end
    
   test  "should not have the same user"do   #测试banner不相同
      banner = Banner.new
      banner1 = Banner.new
      assert_not_same banner,banner1
   end
   
   test "url validation should accept valid url address" do   #测试url格式是否正确
    valid_addresses = %w[https://www.example.com https://www.example2.com/ 
                         https://www.example.com https://www.toutiao.com/a6403429391653536001
                         https://ruby-china.github.io/rails-guides/testing.html]
    valid_addresses.each do |valid_address|
      @banner.url = valid_address
      assert @banner, "#{valid_address.inspect} should be valid"
    end
   end
    
end