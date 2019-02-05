# frozen_string_literal: true

# menus controller, allowing the building of custom menus
class Admin::MenusController < Admin::BaseController
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = 'New menu entry created.'
      redirect_to admin_menus_path
    else
      flash[:error] = 'Error saving menu entry: ' + @menu.errors.full_messages
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = 'Menu link updated.'
      redirect_to admin_menus_path
    else
      flash[:error] = 'Error saving menu: ' + @menu.errors.full_messages
    end
  end

  def new
    @menu = Menu.new
    @menu.parent = Menu.find(params[:parent_id]) if params[:parent_id]
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

  def menu_params
    params.require(:menu).permit(:item_type, :item_id, :published, :url, :parent_id, :sort_order, :subsite_id)
  end
end
