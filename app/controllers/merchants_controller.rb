class MerchantsController < ApplicationController
before_action :authenticate_user!, :current_user, :is_admin?, :only => [:index, :new, :create, :edit, :update]
  
  def new
    @merchant=Merchant.new
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      redirect_to merchants_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @merchant=Merchant.find_by(id: params[:id])
  end

  def update
    @merchant = Merchant.find_by_id(params[:id])
    if @merchant.update_attributes(merchant_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to merchants_path, flash: flash
  end



  def index
    @merchants=Merchant.all
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name,:address,:introduce)
  end


end
