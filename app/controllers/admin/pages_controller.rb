class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  
  def set_page
    @page = Page.friendly.find(params[:id])
  end
  
  def create
    create! { admin_pages_path }
  end
  
  def destroy
    destroy! { admin_pages_path }
  end
  
  def update
    update! { admin_pages_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:page => [:published, :parent_id , :not_in_menu, :postticker_title, :postimage, :show_postimage_on_page, :show_on_bottom, :background_id,
      subsite_ids: [], 
      translations_attributes: [:locale, :id, :title, :body] ]) 
  end
end