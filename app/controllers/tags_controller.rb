class TagsController < ApplicationController
before_action :authenticate_user!, :current_user, :is_admin?, :only => [:index, :new, :create, :edit, :update]

  def new
    @tag=Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, flash: {success: "提交成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @tag=Tag.find_by(id: params[:id])
  end

  def update
    @tag = Tag.find_by_id(params[:id])
    if @tag.update_attributes(tag_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to tags_path, flash: flash
  end



  def index
    @tags=Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end
