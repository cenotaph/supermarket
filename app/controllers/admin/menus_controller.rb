class Admin::MenusController < Admin::BaseController
  
  def create
    create! { admin_menus_path }
  end
  
  def update
    update! { admin_menus_path }
  end
  
  def new
    @menu = Menu.new
    if params[:parent_id]
      @menu.parent = Menu.find(params[:parent_id])
    end
  end
  
  def reorder
    @parent = Menu.find(params[:id])
  end
  
  def sort
    logger.warn('menus are ' + params.inspect)
    @menus = Menu.all
    @menus.each do |menu|
      next if params['menu'].index(menu.id.to_s).nil?
      menu.sort_order = params['menu'].index(menu.id.to_s) + 1
      menu.save
    end
  end
    
  
  protected
  
  def permitted_params
    params.permit(:menu => [:item_type, :item_id, :published, :url, :parent_id, :sort_order, :subsite_id])
  end
end
