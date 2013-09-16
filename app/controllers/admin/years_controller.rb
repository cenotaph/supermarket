class Admin::YearsController < Admin::BaseController
  
  def create
    create! { admin_years_path }
  end
  
  def update 
    update! { admin_years_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:year => [:applications_open, :year])
  end
  
end