class DeviseCustomized::RegistrationsController < Devise::RegistrationsController  
  def new  
    super  
  end  
#   //http://blog.csdn.net/remote_roamer/article/details/24404939
  def create  
    # add custom create logic here  
    super do |resource|  #操 这个super do 咋看不太懂呢
      resource.name = params[:user][:name]  
      resource.role = params[:user][:role]
      puts "name->#{resource.name} role->#{resource.role}";
    end  
  end  
  
  def update  
    super  
  end  
end   