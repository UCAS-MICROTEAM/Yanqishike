class CardsController < ApplicationController
before_action :authenticate_user!, :user_signed_in?, :current_user, :only => [:index, :new, :create, :edit, :update, :destroy]

  def new
    @card=Card.new
  end

  def create
    
    @card=Card.new(card_params, :user_id => @current_user.id)
    puts "dagagfdgsdhsd"
    
    puts "dagagfdgsdhsd"
    if  @card.save
      redirect_to cards_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @card=Card.find_by(id: params[:id])
  end

  def update
    @card = Card.find_by_id(params[:id])
    if @card.update_attributes(card_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to cards_path, flash: flash
  end

  def destroy
    @card=Card.find_by_id(params[:id])
    @card.destroy
    flash={:success => "成功删除: #{@card.content}"}
    redirect_to cards_path, flash: flash
  end

  def index
    @cards=Card.all
  end

  private

  def card_params
    params.require(:card).permit(:content)
  end


end
