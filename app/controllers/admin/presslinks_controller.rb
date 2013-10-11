class Admin::PresslinksController < Admin::BaseController
  
  def create
    create! { admin_presslinks_path }
  end
  
  def destroy
    destroy! { admin_presslinks_path }
  end
  
  def update
    update! { admin_presslinks_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:presslink => [:title, :country, :subsite_id, :url, :year_id, :date_of_press, :attachment, :remove_attachment,  :source, :country])
  end
  
end