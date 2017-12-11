# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#另一种写法
# Book.create :title => '十万个为什么', :author => '李博士'
# 再一种写法
# t=Time.now
# Blog.create(:Title=>"中文第一版",:Created=>t,:Content=>"真实的    中文第一版")
# if User.first == nil 
    # user1 = User.create(:name => "wangbin", :password => "wangbin", :role => 0)
user1 = User.first
if user1 == nil
    # return
    puts "请先在网站上注册一个用户！！！"
end

if Merchant.first == nil
    merchant1 = Merchant.create(:name => "商家1" , :address => "我是商家地址", :introduce => "我是商家介绍", :user => user1 )
    food1 = Food.create(:name => "菜品1", :user => user1, :merchant => merchant1 ) 
else
    merchant1 = Merchant.first
    food1 = Food.first
end

if Status.count <= 2
    for i in 0...20
        # puts "局部变量的值为 #{i}"
        status1 = Status.create(:user => user1, :food => food1, :content => "我是发布的内容内容内容#{i}")
    end 
    # status1 = Status.create(:user => user1, :food => food1, :content => "我是发布的内容内容内容")
else
    status1 = Status.first
end

# if Foodpaper.first = nil
#   foodpaper = Foodpaper.create(:user => user1, :content => "我是Foodpaper的内容")
# end

if Card.count < 3
    for i in 0...20
        card1 = Card.create(:user => user1, :content => "我是小卡片的内容#{i}")
         puts "创建小卡片 #{card1.content}"
    end 
else 
    card1 = Card.first
end

image1 = "http://p3.pstatp.com/origin/1634000698a440297532"
image2 = "http://p3.pstatp.com/origin/168500007a74744d43ec"
url1 = "https://www.toutiao.com/i6383886598123028994/#p=9"
url2 = "https://www.toutiao.com/a6403429391653536001"
if Banner.first == nil
    banner1 = Banner.create(:content => "广告1", :image => image1, :url => url1)
    banner2 = Banner.create(:content => "广告2", :image => image2, :url => url2)
end
