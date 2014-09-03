class Admin::SpacesController < Admin::BaseController
  has_scope :by_approval
  
  def approve
    @space = Space.friendly.find(params[:id])
    @space.approved = true
    @space.save
    redirect_to  '/admin'
  end
  
  def destroy
    destroy! { '/admin/dashboard' }
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
  
  def show
    redirect_to "/initiatives/#{@space.slug}"
  end
  
  protected
  
  def permitted_params
    params.permit(:space =>  [ :business_name, :address1, :address2, :city, :state, :country, :contact_person, :contact_email, :contact_phone, :website1, :website2, :visiting_address1, :visiting_address2, :visiting_city, :visiting_state, :visiting_postcode, :visiting_country, :form_direction, :short_description, :decisionmakers_organisation, :decisionmakers_programming, :founding_year, :is_active, :year_of_closing, :logo, :exhibitors,  :exhibitionspacetype_id, businesstype_ids: [], organisationtype_ids: [], activity_ids: [] ] )

  end
end