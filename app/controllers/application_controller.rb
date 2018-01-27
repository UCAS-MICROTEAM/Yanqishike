class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception先注释掉这句话
  def is_admin?
    if current_user.role!=0
      redirect_to ""
    end
  end
end
