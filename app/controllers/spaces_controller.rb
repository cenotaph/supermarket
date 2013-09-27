class SpacesController < ApplicationController
  include Wicked::Wizard
  autocomplete :space, :business_name
  before_filter :authenticate_user!, :except => [:grant_access, :browse, :aim_profile]
  steps :find_name, :basic_details, :secondary_details
  has_scope :by_country
  
  # def get_autocomplete_items parameters
  #   resp = super(parameters)
  #   if resp.blank?
  #     resp = [OpenStruct.new(id: '', label: 'nothing')]
  #   end
  #   resp
  # end
  
  def aim_profile
    @space = Space.friendly.find(params[:id])
    @filter = @space.business_name + " <span class='hometown'>#{@space.hometown}</span>"
    @closedfilters = true
  end
  
  def browse
    @spaces = apply_scopes(Space).approved.page(params[:page]).per(16)
    @filter = t("aim.all_initiatives")
    if params[:by_country]
      @filter = Country[params[:by_country].downcase].name
    end
    @quotes = t("aim.initiatives_in")  + " " + @filter
    @closedfilters = true
  end
  

  
  def create
    @space = Space.create
    redirect_to wizard_path(steps.first, :space_id => @space.id, :searchterm => params[:space][:business_name])
  end
  
  def edit
    @space = Space.friendly.find(params[:id])
    if !@space.approved_users.include?(current_user)
      flash[:error] = 'This is not your space to edit.'
      redirect_to '/'
    else

      @space.update_attribute(:status, 'find_name')
      @hits = []
      render :template => 'spaces/find_name'
    end
  end
      
  def grant_access
    su = SpaceUser.find_by(approval_token: params[:id])
    if su.nil?
      flash[:error] = 'We cannot find anything with that approval code.'
      redirect_to '/'
    else
      su.approved = true
      su.approval_token = nil
      if su.save
        flash[:notice] = 'That user has been granted access to ' + su.space.name
        redirect_to '/'
      end
    end
  end

  def new
    @space = Space.new
      
  end

  def request_access
    @space = Space.friendly.find(params[:space_id])
    if @space.approved_users.include?(current_user)
      flash[:notice] = 'You already have access to this account.'
      redirect_to wizard_path(:basic_details, :space_id => @space.id)
    else
      su = SpaceUser.find_or_create_by(space_id: @space.id, user_id: current_user.id) 
      if su.save
        SpaceMailer.add_user_access(@space, current_user, su.approval_token).deliver
      else
        flash[:error] = 'Could not save for some reason'
        exit
      end 
    end
  end
  
  def select_existing
    @space = Space.friendly.find(params[:id])
    if @space.approved_users.include?(current_user)
      flash[:notice] = 'You have access to edit this space'
    else
      flash[:error] = 'You are not registered as an owner or manager of this space/gallery'
    end
    
    
  end
  
  def finish
    
  end
  
  def finish_wizard_path
    finish_spaces_path
  end
  
  def show
    @space = Space.find(params[:space_id])
    if params[:searchterm]
      if params[:searchterm].strip.size > 3
        @hits = Space.where(['business_name iLIKE ?', "#{params[:searchterm]}%"])
        @space.business_name = params[:searchterm]
      else
        @hits = []
      end
    else
      @hits = []
    end
    render_wizard
  end

  def update
    
    @space = Space.find(params[:space_id])
    params[:space][:status] = step.to_s
    if step == steps.last
      params[:space][:status] = 'active'
      unless @space.approved_users.include?(current_user)
        SpaceUser.create(:space => @space, :user => current_user, :approved => true)
      end
    end

    @space.update_attributes(params[:space])
    
    if params[:space][:form_direction] == 'previous'
      redirect_to wizard_path(previous_step, :space_id => @space.id)
    else
      redirect_to wizard_path(next_step, :space_id => @space.id)
    end
  end
  
  private
   
  
  def space_params
    params.require(:space).permit(:business_name, :address1, :address2, :city, :state, :country, :contact_person, :contact_email, :contact_phone, :website1, :website2, :visiting_address1, :visiting_address2, :visiting_city, :visiting_state, :visiting_postcode, :visiting_country, :form_direction, :short_description, :decisionmakers_organisation, :decisionmakers_programming, :founding_year, :is_active, :year_of_closing, :logo, :exhibitors, businesstype_ids: []


    )
  end
    
end
