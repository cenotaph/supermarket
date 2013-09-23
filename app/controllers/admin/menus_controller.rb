class Admin::MenusController < Admin::BaseController
  
  def create
    create! { admin_menus_path }
  end
  
  def update
    update! { admin_menus_path }
  end
  
  def sort
    logger.warn('menus are ' + params.inspect)
    @menus = Menu.all
    @menus.each do |menu|
      menu.sort_order = params['menu'].index(menu.id.to_s) + 1
      menu.save
    end
  end
    
  
  protected
  
  def permitted_params
    params.permit(:menu => [:item_type, :item_id, :published, :url, :subsite_id])
  end
end
