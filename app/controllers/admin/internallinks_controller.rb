class Admin::InternallinksController < Admin::BaseController
  respond_to :html, :json
  has_scope :by_subsite
  
  def create
    create! { admin_internallinks_path }
  end
  
  def destroy
    destroy! { admin_internallinks_path }
  end
  
  def update
    update! { admin_internallinks_path }
  end

  
  def index
    @internallinks = apply_scopes(Internallink).includes(:subsite).page(params[:page]).per(15)
    respond_to do |format|
      format.json { 
        render :json => @internallinks.to_json(:only => [:id, :name]), :callback => params[:callback]
      }
      format.html
    end
  end
    
  protected
  
  def permitted_params
    params.permit(:internallink => [:subsite_id, :controller, :action, :parameter, :name, :published])
  end
  
end