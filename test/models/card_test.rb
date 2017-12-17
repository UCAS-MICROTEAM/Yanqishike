require 'test_helper' #调用test——helper里的函数


class CardTest < ActiveSupport::TestCase
    def setup
       @card=Card.create(:content => "我是小卡片的内容")
    end
    
    test "the truth" do   
      assert true
    end
    
    test "should be valid" do #测试card是否存在
     assert  @card
    end
   
    test "card should not be nil" do   
     assert_not_nil  @card
    end
    
    test "content should not be nil" do  #测试content不为nil
     assert_not_nil  @card.content
    end
    
    test "content should not be empty"do
     assert_not_empty @card.content
    end
    
    test  "should not have the same card"do   #测试card不相同
      card = Card.new
      card1 = Card.new
      assert_not_same card,card1
    end
   

end    