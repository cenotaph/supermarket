class Admin::YearsController < Admin::BaseController
  
  def create
    create! { admin_years_path }
  end
  
  def update 
    update! { '/admin' }
  end
  
  protected
  
  def permitted_params
    params.permit(:year => [:applications_open, :reveal_decisions, :header_html, :footer_html, :above_carousel_html, :center_above_carousel_text, :allow_editing, :year, :tv_description])
  end
  
end