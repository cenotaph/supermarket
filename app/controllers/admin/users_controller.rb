class Admin::UsersController < Admin::BaseController
  
  def update
    update! { '/admin/dashboard' }
  end 

  protected
  
  def permitted_params
    params.permit(:user => [:photo, :remove_photo])
  end
end
