class Banner < ActiveRecord::Base
    #这里面是Rails 4.2.5，ApplicationRecord是rails5中的
    validates :content, presence: true
    validates :image, presence: true
    validates :url, presence: true
end
