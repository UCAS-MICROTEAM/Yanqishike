class ProfileController < ApplicationController
  def index #标题栏“我的主页”
    @cards = current_user.cards
    @statuses = current_user.statuses
  end
end
