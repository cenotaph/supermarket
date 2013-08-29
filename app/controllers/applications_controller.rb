class ApplicationsController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!
  steps :address_and_location, :basic_info, :proposals, :secondary_info, :confirm
  
  def create
    @application = Application.create(params[:application])
    redirect_to wizard_path(steps.first, :application_id => @application.id)
  end
    
  def edit
    @application = Application.find(params[:id])
    @space = @application.space
    if @application.space.users.include?(current_user) && @application.status != 'active'
      render :template => 'applications/new'
    else
      flash[:error] = 'You cannot edit this application.'
      redirect_to '/'
    end
  end
    
  def new
    year = Year.where(:year => params[:year]).first
    @space = Space.friendly.find(params[:space_id])
    if @space.users.include?(current_user) || current_user.has_role?(:staff)
      @application = Application.new(:year_id => year.id, :space_id => @space.id, :user => current_user)
    else
      flash[:error] = 'You do not have permission to apply for this organisation.'
      redirect_to '/'
    end
  end

  def show
    if params[:application_id].nil?
      @application = Application.find(params[:id])
      if !@application.space.approved_users.include?(current_user)
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      end
    else        
      @application = Application.find(params[:application_id])
      if !@application.space.approved_users.include?(current_user)
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      else
        render_wizard
      end
    end
  end

  def update

    if params[:id] =~ /^\d*$/
      @application = Application.find(params[:id])
      step = steps.first
    else
      @application = Application.find(params[:application_id])
      # step = params[:id] if step.nil?
    end
    
    params[:application][:status] = step.to_s
    if params[:application][:form_direction] == 'completed'
      params[:application][:status] = 'active'
      @application.submitted_at = Time.now.localtime.to_date
      ApplicationMailer.application_confirmation(@application, current_user).deliver
      flash[:notice] = 'Thank you for completing your application. You will hear from us soon.'
    end
  
    @application.update_attributes(params[:application])
    if params[:application][:form_direction] == 'previous'
      redirect_to wizard_path(previous_step, :application_id => @application.id)
    elsif params[:application][:form_direction] == 'start'
      redirect_to edit_application_path(@application)
    else

      if step.nil? && !params[:application][:contact_city].blank?
        redirect_to wizard_path(steps.first, :application_id => @application.id)
      else
        redirect_to wizard_path(next_step, :application_id => @application.id)
      end
    end
  end
  
  private
  
  def application_params
    params.require(:application).permit(:space_id, :year_id, :user_id, :organisation_name, :contact_first_name, :contact_last_name, :contact_email, :contact_phone, :form_direction, :exhibitor_address1, :exhibitor_address2, :exhibitor_city, :exhibitor_state, :exhibitor_country, :exhibitor_postcode, :hometown, :staff, :application_image, :apply_to_malongen, :malongen_use, :supermarket_proposal,  space_attributes: [:exhibitors, :id, :exhibitionspacetype_id], website_attributes: [:id, :url, :application_id], applicationlink_attributes: [:id, :url, :title, :application_id], videolink_attributes: [:id, :application_id, :video_provider, :title, :url], applicationwebimage_attributes: [:id, :application_id, :imagefile, :title, :sortorder]

    )
  end
    

end