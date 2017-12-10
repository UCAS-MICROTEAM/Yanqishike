class User < ActiveRecord::Base
    has_many :statuses
    has_many :comments
    has_many :cards
    has_many :merchants
end
