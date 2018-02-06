雁栖食客
===============

中国科学院大学 高级软件工程

小组成员
----
王斌，杨颖珊，张富友，寇英帅</br>

开发文档
----
见 [dev_doc/doc.md](https://github.com/UCAS-MICROTEAM/Yanqishike/blob/master/dev_doc/doc.md)

TODO
----
见 [dev_doc/TODO.md](https://github.com/UCAS-MICROTEAM/Yanqishike/blob/master/dev_doc/TODO.md)

进度
-----
### 2017.12.09
* 初创工程
* 创建github小组

### 2017.12.10
* 王斌@创建Model  

### 2017.12.11
* 王斌@基于devise做了登录注册等  
* 王斌@合并了devise的User和本项目的User字段  
* 王斌@基于bootstrap美化了注册界面  
* 王斌@引入botostrap皮肤
* 王斌@引入devise中文翻译
* 王斌@初步建立开发文档dev_doc/doc.md


测试区
----
这行是张富友添加的  
这行是王斌添加的  
这行是寇英帅添加的    
这行是杨颖珊提交的
如果我们想把一行文本进行换行，我们可以在需要换行的地方输入至少两个空格，然后回车即可  
  

测试说明
----
项目共包含模型、控制器的部分测试以及涵盖率检测，测试文件位于项目的``/test``目录下，可以通过执行``rake test``  
一键运行所有测试。运行结果如下：
```
Finished in 1.376580s, 34.8690 runs/s, 47.9449 assertions/s.

48 runs, 66 assertions, 0 failures, 0 errors, 0 skips
Coverage report generated for MiniTest to /home/ubuntu/workspace/coverage. 66 / 360 LOC (18.33%) covered.
```
#model测试
下面以banner模型为例介绍模型测试。测试文件位于``test/models/banner_test.rb``.首先在测试文件中生成一个``@banner``  
变量，通过``assert``测试对象是否存在，之后通过``assert_not_nil`` 来确保``banner``内容不为空。通过``valid``测试``url``格式是否  
正确，如果``@banner.url``格式不正确，测试会报错。``banner``模型的测试可以通过``rake test test/models/banner_test.rb``  
来单独执行测试。
```Ruby
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
   test "url validation should accept valid url address" do   #测试url格式是否正确
    valid_addresses = %w[https://www.example.com https://www.example2.com/ 
                         https://www.example.com https://www.toutiao.com/a6403429391653536001
                         https://ruby-china.github.io/rails-guides/testing.html]
    valid_addresses.each do |valid_address|
      @banner.url = valid_address
      assert @banner, "#{valid_address.inspect} should be valid"
    end
   end
   ...
end
```
#视图和控制器测试
这里以小卡片控制器测试为例，测试文件位于``test/controllers/card_controller_test.rb``.首先在测试文件中  
生成一个``@card``对象，这个对象所对应的添加该卡片的用户名和密码可以``在test/fixtures/card.yml``中指定。之后  
通过``get``的方法到达小卡片的界面（``cards_path``),通过 ``assert_response``确保界面响应。之后``get cards_url`，  
通过``assert_redirected_to``来测试``cards_url``是否重定向到`` user_session_url``，判断跳转过程是否发生，之后  
用``assert_equal``测试跳转后的``flash``内容，来判断当前小卡片的提交状态。
```Ruby  
class CardsControllerTest < ActionController::TestCase
   
  def setup
    @card=Card.new(card_params)
  end
  test "should get http" do
    get cards_path
    assert_response :redirect  
  end
  def test_index_without_user

    get cards_url

    assert_redirected_to user_session_url

    assert_equal nil, flash[:warning]
   end
end
```  
#涵盖率测试  
我们可以使用simplecov库来检测我们编写的测试对于我们的项目是否完整，步骤如下：

* 1.在Gemfile文件中导入simplecov库：``gem 'simplecov', :require => false, :group => :test``，然后``bundle install``安装
* 2.在``test/test_helper.rb``的最前面加入simplecov的启动代码（这里默认使用rails自带的test框架，  
* simplecov也支持其他测试框架如rspec，那么启动代码导入的位置请参考simplecov的官方文档）  
```
require 'simplecov'
SimpleCov.start 'rails' 
#simplecov测试覆盖率
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end  
```


Welcome to your Rails project on Cloud9 IDE!
To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://HOSTNAME/).

Happy coding!
The Cloud9 IDE team

## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide


     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 
    
    
License
-----------

    Copyright 2017 王斌，杨颖珊，张富友，寇英帅

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
