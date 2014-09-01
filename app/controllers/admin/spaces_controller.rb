class Admin::SpacesController < Admin::BaseController
  has_scope :by_approval
  
  def approve
    @space = Space.friendly.find(params[:id])
    @space.approved = true
    @space.save
    redirect_to  '/admin'
  end
  
  def delete
    delete! { '/admin' }
  end
  
  def index
    @spaces = apply_scopes(Space).page(params[:page]).per(50)
  end
  
  def space_application
    @space = Space.friendly.find(params[:id])
    render :layout => false
  end
  
  def unapprove
    @space = Space.friendly.find(params[:id])
    @space.approved = false
    @space.save
    redirect_to '/admin'
  end
  
end