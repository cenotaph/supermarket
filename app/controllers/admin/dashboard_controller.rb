class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  
  def authenticate_admin
    redirect_to root_path unless current_user.has_role?(:staff) || current_user.has_role?(:god)
  end
  
  def index
    unless current_user.photo?
      flash[:error] = 'You really should upload a profile photo. It will be nicer that way.'
      redirect_to edit_admin_user_path(current_user)
    end
  end
  
end