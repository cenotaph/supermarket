# frozen_string_literal: true

class Admin::InternallinksController < Admin::BaseController
  respond_to :html, :json
  has_scope :by_subsite

  def create
    @internallink = Internallink.new(internallink_params)
    if @internallink.save
      flash[:notice] = 'New internal link created.'
      redirect_to admin_internallinks_path
    else
      flash[:error] = 'Error saving internal link: ' + @internallink.errors.full_messages
    end
  end

  def destroy
    destroy! { admin_internallinks_path }
  end

  def update
    @internallink = Internallink.find(params[:id])
    if @internallink.update(internallink_params)
      flash[:notice] = 'Internal link updated.'
      redirect_to admin_internallinks_path
    else
      flash[:error] = 'Error saving internal link: ' + @internallink.errors.full_messages
    end
  end

  def index
    @internallinks = apply_scopes(Internallink).includes(:subsite).page(params[:page]).per(15)
    respond_to do |format|
      format.json do
        render json: @internallinks.to_json(only: %i[id name]), callback: params[:callback]
      end
      format.html
    end
  end

  protected

  def internallink_params
    params.require(:internallink).permit(:subsite_id, :controller, :display_name, :custom_url, :action, :parameter, :name, :published)
  end
end
