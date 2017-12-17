class Merchant < ActiveRecord::Base
    belongs_to :user
    has_many :foods
    validates :name, presence: true
end
