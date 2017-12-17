class StatusesController < ApplicationController
before_action :authenticate_user!, :user_signed_in?, :current_user, :only => [:index, :new, :create, :edit, :update, :destroy, :createcomment]

  def new
    @status=Status.new
    @merchants = Merchant.all
  end

  def create
    # @status = Status.new(status_params)
    # 这里我们提交的参数并非完全是status的参数，
    # 而且我们用的是form_tag， 而不是form_for
    # 所以我们要自己解析参数
    # 操操操，params不加:号
    @status = Status.new
    @status.content = params["content"]
    @status.user = current_user
    @merchant_name = params["merchant_name"]
    @food_name =  params["food_name"]
    if @merchant_name == nil || @food_name == nil
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
      return
    end
      
    puts "============================="
    puts "content->" + params["content"]
    puts "merchant_name->"  +  @merchant_name
    puts "food_name->" + @food_name
    puts "============================="
    @merchant = Merchant.find_by_name(params["merchant_name"])
    if @merchant == nil #不存在该商家则自动创建
      @merchant = Merchant.create(:name => @merchant_name)
    end
    # Food.find_by_merchant_id_and_name(2,"菜品2 of 商家2")      
    @food = Food.find_by_merchant_id_and_name(@merchant.id, @food_name)
    if @food == nil
      @food = Food.create(:name => @food_name , :merchant => @merchant)
    end
    @status.food = @food
    puts "merchant->#{@merchant}";
    puts "food->#{@food}";
    puts "============================="
    # resource.role = params[:user][:role]
    #   puts "name->#{resource.name} role->#{resource.role}";
    if @status.save
      redirect_to statuses_path, flash: {success: "发布成功"}
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
    redirect_to statuses_path, flash: flash
  end

  def destroy
    @status=Status.find_by_id(params[:id])
    @status.destroy
    flash={:success => "成功删除: #{@status.content}"}
    redirect_to statuses_path, flash: flash
  end

  def index
    @statuses = current_user.statuses
  end
  
  def show
    @status=Status.find_by_id(params[:id])
    @comments=@status.comments
  end
  
  ###########################################自定义路由########################################
  
  def list
    @statuses=Status.all
  end
  
  def createcomment
    @comment = Comment.new
    @comment.content = params["content"]
    @comment.user = current_user
    @status_id = params["status_id"]
    @status=Status.find_by_id(@status_id)
    @comment.status=@status
    if @comment.content!=""
      @comment.save
    end
    redirect_to :action => 'show', :id => @status
  end
  
  #############################################################################################
  
  ########################局部刷新商家包含的food列表######################
  
  def foodofmerchant
    #params[:id]是merchant的id
    puts params
    # @m_id = params[:id]
    @m_id = params["format"]
    puts "=====================foodofmerchant.id=#{@m_id}"
    @merchant = Merchant.find(@m_id)
    if @merchant == nil
      redirect_to new_statuses_path, flash: {error: "未找到对应商家"}
      return
    end
    @foods = @merchant.foods
    # render :update do |page| 
      # partial: 'statuses/food', :locals => { :foods_local => @foods }
      # page.replace_html "被替换的ID", :partial => 'statuses/food', :locals => { :foods_local => @foods }
      # page.replace_html "id_new_statuses_food", :partial => 'statuses/food', :locals => { :foods_local => @foods }
    # end
    render :partial => 'statuses/food', :locals => { :foods_local => @foods } , :id => "id_new_statuses_food"
  end
  #############################################################################################

  private

  def status_params
    params.require(:status).permit(:content)
  end


end
