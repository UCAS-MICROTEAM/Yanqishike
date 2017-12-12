source 'https://rubygems.org'
# source 'https://gems.ruby-china.org'



# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# 以上是默认的，以下是新增的
# http://blog.csdn.net/ysc6688/article/details/46391503
gem 'devise'  #管理登录状态、注册等
# devise中文化 http://blog.sina.com.cn/s/blog_8254427901019ig5.html
# 在需要登录的control中加上：before_filter:authenticate_user!

gem 'devise-bootstrap-views'
gem 'bootstrap-sass', '~> 3.3.7'
# gem 'bootstrap-sass', '~> 4.0.0-beta2'
# fuck只能命令行输入 gem install bootstrap -v 4.0.0.beta2

# gem 'sass-rails', '>= 3.2'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# bootswatch主题
# https://bootswatch.com/3/flatly/
# gem 'bootswatch-rails'  
# 新增end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

