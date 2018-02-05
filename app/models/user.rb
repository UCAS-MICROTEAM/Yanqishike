class User < ActiveRecord::Base
  # 本项目的has_many
  has_many :statuses
  has_many :comments
  has_many :cards
  has_many :merchants
  has_many :zans
  # has_many END
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
