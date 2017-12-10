class Tag < ActiveRecord::Base
    has_many :foods , through: :food_tags
end
