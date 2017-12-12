class ProfileController < ApplicationController
  def index #标题栏“我的主页”
    @cards = current_user.cards
  end
end
