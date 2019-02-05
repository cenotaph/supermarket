# frozen_string_literal: true

class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: %i[show edit update destroy]
  respond_to :html, :json
  has_scope :by_subsite
  handles_sortable_columns

  def set_page
    @page = Page.friendly.find(params[:id])
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = 'Saved.'
      redirect_to admin_pages_path
    else
      flash[:error] = 'Error saving page: ' + @page.errors.full_messages.join('; ')
    end
  end

  def edit
    @page = Page.friendly.find(params[:id])
  end

  def destroy
    @page = Page.friendly.find(params[:id])
    @page.destroy!
    flash[:notice] = 'Page deleted.'
    redirect_to admin_pages_path   
  end

  def update
    @page = Page.friendly.find(params[:id])
    if @page.update(page_params)
      flash[:notice] = 'Post updated.'
      redirect_to admin_pages_path
    else
      flash[:error] = 'Error saving post: ' + @page.errors.full_messages
    end
  end

  def new
    @page = Page.new(posted_by_id: current_user.id)
  end

  def index
    order = sortable_column_order do |column, direction|
      case column
      when 'name'
        "slug #{direction}"
      when 'status'
        "published #{direction}"
      else
        "pages.id #{direction}"
      end
    end
    @pages = apply_scopes(Page).includes(:subsites).references(:subsites).order(order).page(params[:page]).per(100)
    respond_to do |format|
      format.json do
        render json: @pages.to_json(only: %i[id title]), callback: params[:callback]
      end
      format.html
    end
  end

  protected

  def page_params
    params.require(:page).permit(:published, :parent_id, :is_private, :not_in_menu, :postticker_title, :postimage, :show_postimage_on_page, :show_on_bottom, :background_id,
                         subsite_ids: [],
                         translations_attributes: %i[locale id title body])
  end
end
