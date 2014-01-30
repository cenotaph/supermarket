class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  #load_and_authorize_resource
  # check_authorization
  # load_and_authorize_resource
  # skip_before_filter :require_no_authentication

 
  
  def authenticate_admin
    if @site == 'aim'
      redirect_to root_path unless current_user.is_aim_staff?
    else
      redirect_to root_path unless current_user.is_staff?
    end
  end
  def index
    unless current_user.photo?
      flash[:error] = 'You really should upload a profile photo. It will be nicer that way.'
      redirect_to edit_admin_user_path(current_user)
    end
  end
  
end