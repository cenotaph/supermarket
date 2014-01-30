class Admin::SpacesController < Admin::BaseController
  has_scope :by_approval
  
  def approve
    @space = Space.friendly.find(params[:id])
    @space.approved = true
    @space.save
    redirect_to admin_spaces_path
  end
  
  
  def index
    @spaces = apply_scopes(Space).page(params[:page]).per(50)
  end
  
  
  def unapprove
    @space = Space.friendly.find(params[:id])
    @space.approved = false
    @space.save
    redirect_to admin_spaces_path
  end
  
end