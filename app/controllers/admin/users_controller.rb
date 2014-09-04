class Admin::UsersController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  handles_sortable_columns
  
  def update
    update! { '/admin/dashboard' }
  end 
  
  def index
    order = sortable_column_order do |column, direction|
      case column
      when "display_name"
        "#{column} #{direction}"
      when "initiative"
        "lower(spaces.business_name) #{direction}"
      when "roles"
        "roles.name #{direction}"
      else
        "last_sign_in_at DESC"
      end
    end
    
    respond_to do |format|
      format.html {
        @users = User.includes([:roles, :spaces]).references(:space_users).order(order).page(params[:page]).per(100)
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
