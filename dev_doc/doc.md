### 常用命令 by 王斌
* rake routes 查看当前路由
* rails generate migration NAME 生成数据库迁移，NAME是你起的名字，generate可缩写为g
* rake db:migrate 执行数据库迁移，指定版本 rake db:migrate VERSION=20080906120000
* rake db:reset 重置数据库，相当于db:drop + db:setup，setup的时候会自动执行迁移
* bundle 根据gemfile来安装依赖库
* rails console 进入控制台，通过Model.connection可以连接数据，然后可执行数据库操作，如
* User.connection回车，User.all，User.find(2),User.first,User.first(3)等
* 再如 Book.create :title => '十万个为什么', :author => '李博士'
* 再再如 u = User.first, u.name = "新名字" , u.save
* rake db:seed 执行seeds.rb，来填充测试数据
* Model 名字是单数,controller 都是复数,
* 如app/models/user.rb ,class User < ActiveRecord::Base,对应users_controller
* belongs_to 后面必须是单数, 都是小写, has_many 后面必须是复数 
* rails generate controller home index 生成控制器


### devise的几个方法 by 王斌
* [详见官方github](https://github.com/plataformatec/devise) 
* user_signed_in?，当前是否有登陆用户
* current_user， 获取当前登陆用户
* authenticate_user!，验证用户是否登陆，常用于before_filter
* before_filter :authenticate_user!  
* 另，如果你创建的devise model叫admin，那么该方法就是authenticate_admin!，以下方法同理。这又是ruby玩的一个小把戏了。
* user_session, 用户session，类似于session，也是一个hash表，可以用来保存用户特有的数据
* after_sign_in_path_for和after_sign_out_path_for方法指定用户登入/登出后的跳转url.


