class StatusesController < ApplicationController
before_action :authenticate_user!, :user_signed_in?, :current_user, :only => [:index, :new, :create, :edit, :update, :destroy]

  def new
    @status=Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to statuses_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @status=Status.find_by(id: params[:id])
  end

  def update
    @status = Status.find_by_id(params[:id])
    if @status.update_attributes(status_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to banners_path, flash: flash
  end

  def destroy
    @status=Status.find_by_id(params[:id])
    @status.destroy
    flash={:success => "成功删除: #{@status.content}"}
    redirect_to statuses_path, flash: flash
  end

  def index
    @statuses=current_user.statuses
  end
  
  ###########################################自定义路由########################################
  
  def list
    @statuses=Status.all
  end
  
  #############################################################################################

  private

  def status_params
    params.require(:status).permit(:content)
  end


end
