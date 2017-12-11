class BannersController < ApplicationController
before_action :authenticate_user!, :user_signed_in?, :only => [:index, :new, :create, :edit, :update, :destroy]

  def new
    @banner=Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to banners_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @banner=Banner.find_by(id: params[:id])
  end

  def update
    @banner = Banner.find_by_id(params[:id])
    if @banner.update_attributes(banner_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to banners_path, flash: flash
  end

  def destroy
    @banner=Banner.find_by_id(params[:id])
    @banner.destroy
    flash={:success => "成功删除: #{@banner.content}"}
    redirect_to banners_path, flash: flash
  end

  def index
    @banners=Banner.all
  end

  private

  def banner_params
    params.require(:banner).permit(:content,:image,:url)
  end


end
