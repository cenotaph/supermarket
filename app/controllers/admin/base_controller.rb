class Admin::BaseController < InheritedResources::Base
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  #load_and_authorize_resource
  # check_authorization
  # load_and_authorize_resource
  # skip_before_filter :require_no_authentication
  check_authorization
  load_and_authorize_resource #:find_by => :slug
  
  def authenticate_admin
    @nofilters = true
    if @site == 'aim'
      redirect_to root_path unless current_user.is_aim_staff?
    else
      redirect_to root_path unless current_user.is_staff?
    end
  end
  
  def check_permissions
    authorize! :create, resource
  end
  
  def home

  end

end
