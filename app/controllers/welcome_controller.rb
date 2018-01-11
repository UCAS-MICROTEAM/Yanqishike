class WelcomeController < ApplicationController
    def index
      @uuu = User.first(2)
    #   @all_cards = Card.all
        # if user_signed_in? 
            # @index_statuses =  current_user.statuses.last(3)
        # end
        # 近期的动态（美食记）
        # @index_statuses =  Status.last(5).reverse
        @index_statuses =  Status.all.reverse
        # 近期的美食单
        # @index_foodpapers = Foodpaper.last(6).reverse!
        # 小卡片
        @index_cards = Card.last(10).reverse
        @index_banners = Banner.all
    end

    def ajaxloadcards
        # render :text  => {:name => "David"}.to_json
        # https://stackoverflow.com/questions/3226054/how-to-convert-a-ruby-object-to-json
        @index_cards = Card.last(10).reverse
        render :json => @index_cards
        puts "==============================================ajaxloadcards"
    end
end