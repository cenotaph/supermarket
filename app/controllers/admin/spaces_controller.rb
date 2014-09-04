class Admin::SpacesController < Admin::BaseController
  has_scope :by_approval
  
  def approve
    @space = Space.friendly.find(params[:id])
    @space.approved = true
    @space.save
    redirect_to  '/admin'
  end
  
  def comment
    @space = Space.find(params[:id])
    @space.spacecomments << Spacecomment.new(params[:spacecomment].permit([:user_id, :application_id, :comment, :deny_field]) )
    if params[:spacecomment][:deny_field] == "1"
      @space.denied = true
      @space.denied_by = params[:spacecomment][:user_id]
    end
    if @space.save
      flash[:notice] = 'Your comment has been posted.'
    else
      flash[:error] = 'There was an error saving your comment: ' + @space.errors.messages.flatten
    end
    redirect_to admin_space_path(@space)
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
  

  protected
  
  def permitted_params
    params.permit(:space =>  [ :business_name, :address1, :address2, :city, :state, :country, :contact_person, :contact_email, :contact_phone, :website1, :website2, :visiting_address1, :visiting_address2, :visiting_city, :visiting_state, :visiting_postcode, :visiting_country, :form_direction, :short_description, :decisionmakers_organisation, :decisionmakers_programming, :founding_year, :is_active, :year_of_closing, :logo, :exhibitors, :denied,  :exhibitionspacetype_id, businesstype_ids: [], organisationtype_ids: [], activity_ids: [] ], :spacecomment => [:user_id, :comment, :deny_field, :space_id] )

  end
end