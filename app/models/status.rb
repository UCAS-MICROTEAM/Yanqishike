class Status < ActiveRecord::Base
    belongs_to :user
    belongs_to :food
    has_many :comments
    has_many :zans
end
