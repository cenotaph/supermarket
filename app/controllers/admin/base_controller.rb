class Admin::BaseController < InheritedResources::Base
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  #load_and_authorize_resource
  # check_authorization
  # load_and_authorize_resource
  # skip_before_filter :require_no_authentication
 
  def authenticate_admin
    redirect_to root_path unless current_user.has_role?(:staff) || current_user.has_role?(:god)
  end
  
  def check_permissions
    authorize! :create, resource
  end
  
  def home

  end

end
