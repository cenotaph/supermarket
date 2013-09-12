class Admin::UsersController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
 
  def update
    update! { '/admin/dashboard' }
  end 
  
  def index
    respond_to do |format|
      format.html {
        @users = User.page(params[:page])
      }
      format.csv {
        @users = User.all
      }
    end
  end
        

  protected
  
  def permitted_params
    params.permit(:user => [:photo, :remove_photo, :display_name, :email])
  end
end
