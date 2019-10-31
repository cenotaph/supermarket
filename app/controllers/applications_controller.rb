# frozen_string_literal: true

class ApplicationsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  skip_before_action :setup_wizard, only: %i[applylanding accept_terms
                                             notify_of_decision allow_late
                                             check_invited edit new view invited
                                             terms]
  steps :address_and_location, :basic_info, :proposals, :secondary_info, :media, :supermarket_particulars, :confirm

  def applylanding
    if current_user.approved_space_users.approved.size == 1
      redirect_to '/apply/2020/' + current_user.spaces.first.slug
    elsif current_user.approved_space_users.approved.empty?
      redirect_to new_space_path
    end
  end

  def accept_terms
    @application = Application.find(params[:id])
    if @application.space.users.include?(current_user)
      @application.accepted_terms = true
      @application.accepting_name = params[:application][:accepting_name]
      if @application.save
        flash[:notice] = 'You have accepted the terms. Thank you.'
        render template: 'applications/terms'
      else
        flash[:error] = 'There was an error saving your term acceptance: ' + @application.errors.full_messages.join + '. Please try again'
      end
    else
      flash[:error] = 'This is not your application.'
      redirect_to '/'
    end
  end

  def allow_late
    year = Year.where(year: params[:year]).first
    @space = Space.friendly.find(params[:space_id])
    if @space.users.include?(current_user) || current_user.has_role?(:staff)
      @application = Application.new(year_id: year.id, space_id: @space.id, allow_late: true, user: current_user)
      render template: 'applications/new'
    else
      flash[:error] = 'You do not have permission to apply for this organisation.'
      redirect_to '/'
    end
  end

  def check_invited
    if params[:password] != 'ABat40T'
      flash[:error] = 'Sorry, that is not the correct password'
      redirect_to invited_path
    end
  end

  def create
    @application = Application.create(params[:application])
    unless @application.space.website1.blank?
      @application.applicationlinks << Applicationlink.create(url: @application.space.website1)
    end
    unless @application.space.website2.blank?
      @application.applicationlinks << Applicationlink.create(url: @application.space.website2)
    end
    redirect_to wizard_path(steps.first, application_id: @application.id)
  end

  def edit
    @application = Application.find(params[:id])
    @space = @application.space
    if current_user
      if current_user.has_role?(:god) || @application.allow_late == true || @application.year.allow_editing == true
        render template: 'applications/new'
      else
        flash[:error] = 'You cannot edit this application.'
        redirect_to '/'
      end
    else
      flash[:error] = 'You cannot edit this application.'
      redirect_to '/'
    end
  end

  def invited; end

  def new
    year = Year.where(year: params[:year]).first
    @space = Space.friendly.find(params[:space_id])
    if (@space.users.include?(current_user) || current_user.has_role?(:staff)) && year.open?
      if @space.applications.where(year_id: year).empty?
        @application = Application.new(year_id: year.id, space_id: @space.id, user: current_user)
      else
        @application = @space.applications.where(year_id: year).first
      end
    elsif !year.open? # && year.allow_editing == false
      flash[:error] = 'Applications for ' + year.year.to_s + ' are now closed.'
      redirect_to '/'
    elsif year.allow_editing == true && @space.users.include?(current_user)
      if @space.applications.where(year_id: year).empty?
        @application = Application.new(year_id: year.id, space_id: @space.id, user: current_user)
      else
        @application = @space.applications.where(year_id: year).first
      end
    else
      flash[:error] = 'You do not have permission to apply for this organisation.'
      redirect_to '/'
    end
  end

  def interested_2016; end

  def notify_of_decision
    @application = Application.find(params[:id])
    @application.space.space_users.approved.map(&:user).each do |u|
      if ApplicationMailer.application_confirmation(@application, u).deliver
        @application.notified_of_decision = Time.now
      end
    end
    @application.save
    redirect_to @application
  end

  def view
    if params[:application_id].nil?
      @application = Application.find(params[:id])
      unless @application.space.approved_users.include?(current_user) || current_user.has_role?(:god)
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      end
    else
      @application = Application.find(params[:application_id])
      if @application.space.approved_users.include?(current_user) || current_user.has_role?(:god)
        render_wizard
      else
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      end
    end
  end

  def show

    if params[:application_id].nil?
      @application = Application.find(params[:id])
      unless @application.space.approved_users.include?(current_user) || current_user.has_role?(:god)
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      end
    else
      @application = Application.find(params[:application_id])
      if @application.space.approved_users.include?(current_user) || current_user.has_role?(:god)
        render_wizard
      else
        flash[:error] = 'This is not your application to view'
        redirect_to '/'
      end
    end
  end

  def terms
    @application = Application.find(params[:id])
    if @application.space.users.include?(current_user) && @application.approved_pending_reveal?
      render template: 'applications/terms'
    else
      flash[:error] = 'This is not your application.'
      redirect_to '/'
    end
  end

  def update
    if /^\d*$/.match?(params[:id])
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
      # ApplicationMailer.application_confirmation(@application, current_user).deliver
      flash[:notice] = 'Thank you for completing/updating your application. You will hear from us soon.'
    end

    @application.update_attributes(params[:application])

    if params[:application][:form_direction] == 'previous'
      redirect_to wizard_path(previous_step, application_id: @application.id)
    elsif params[:application][:form_direction] == 'start'
      redirect_to edit_application_path(@application)
    else

      if step.nil? && params[:application][:form_direction] == 'start'
        redirect_to wizard_path(steps.first, application_id: @application.id)
      elsif step.nil? && params[:application][:form_direction] == 'beginning'
        redirect_to wizard_path(:address_and_location, application_id: @application.id)
      else
        redirect_to wizard_path(next_step, application_id: @application.id)
      end
    end
  end

  private

  def application_params
    params.require(:application).permit(:space_id, :year_id, :organisation_contact_email, :user_id, :wants_forum, :organisation_name, :exhibitor_phone, :organisation_email, :networking_only, :accepting_name, :accepted_terms, :contact_first_name, :contact_last_name, :contact_email, :contact_phone, :contact_address1, :contact_address2, :contact_city, :contact_state, :contact_country, :contact_postcode, :form_direction, :exhibitor_address1, :exhibitor_address2, :exhibitor_city, :organisation_description, :exhibitor_state, :exhibitor_country, :allow_late, :exhibitor_postcode, :hometown, :staff, :application_image, :apply_to_malongen, :malongen_use, :upload1, :upload2, :remove_upload1, :remove_upload2, :supermarket_proposal, :need_darker_room, :wants_open_structure, :booth_applied, :vat_number, :special_needs, space_attributes: %i[exhibitors id exhibitionspacetype_id short_description decisionmakers_organisation decisionmakers_programming founding_year is_active year_of_closing organisationtype_ids], website_attributes: %i[id url application_id], applicationlinks_attributes: %i[id _destroy url title application_id], videolinks_attributes: %i[id application_id _destroy video_provider title url], applicationwebimages_attributes: %i[id application_id _destroy imagefile title sortorder])
  end
end
