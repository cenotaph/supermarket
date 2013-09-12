class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  
  def authenticate_admin
    redirect_to root_path unless current_user.has_role?(:staff) || current_user.has_role?(:god)
  end
  
  def index
    
  end
  
end