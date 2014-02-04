class Admin::FrontcarouselsController < Admin::BaseController

  
  def create
    create! { admin_frontcarousels_path }
  end
  
  def destroy
    destroy! { admin_frontcarousels_path }
  end
  
  def update
    update! { admin_frontcarousels_path }
  end
  
  protected
  
  def permitted_params 
    params.permit(:frontcarousel => [:image, :published, :link_to, :title, :caption, :customcss, :subsite_id]) 
  end   
end
