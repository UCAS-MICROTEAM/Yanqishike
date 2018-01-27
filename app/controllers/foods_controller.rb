class FoodsController < ApplicationController
before_action :authenticate_user!, :current_user, :is_admin?, :only => [:index, :new, :create, :edit, :update]

  def new
    #@merchants=Merchant.all
    @food=Food.new
  end

  def create
    @food = Food.new
    @food.name=food_params[:name]
    @merchant_id=food_params[:merchant_id]
    if @merchant_id == "" || @food.name == ""
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
      return
    end
    @merchant=Merchant.find_by_id(@merchant_id)
    @food.merchant=@merchant
    if @food.save
      redirect_to foods_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    #@merchants=Merchant.all
    @food=Food.find_by(id: params[:id])
  end

  def update
    @food = Food.find_by_id(params[:id])
    if @food.update_attributes(food_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to foods_path, flash: flash
  end


  def index
    @foods=Food.all
  end

  private

  def food_params
    params.require(:food).permit(:name,:merchant_id)
  end


end



