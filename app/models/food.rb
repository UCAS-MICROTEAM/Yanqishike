class Food < ActiveRecord::Base
    belongs_to :user
    belongs_to :merchant
    has_many :tags , through: :food_tags
    has_many :statuses
end
