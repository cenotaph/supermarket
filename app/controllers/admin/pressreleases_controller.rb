class Admin::PressreleasesController < Admin::BaseController
  
  def create
    create! { admin_pressreleases_path }
  end
  
  def destroy
    destroy! { admin_pressreleases_path }
  end
  
  def update
    update! { admin_pressreleases_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:pressrelease => [:title, :description, :subsite_id, :attachment_eng, :attachment_swe, :image, :published, :date_of_release, :remove_attachment_eng, :remove_attachment_swe, :remove_image, :year_id])
  end

end
