# frozen_string_literal: true

class ExhibitorsController < ApplicationController
  def show
    @year = Year.find_by(year: params[:year])
    if @year.nil?
      redirect_to('/') && return
    else
      @application = Application.find_by(space: Space.friendly.find(params[:space]), year: @year)
      if @application.nil?
        flash[:error] = 'No such application.'
        redirect_to('/') && return
      elsif !@application.approved?
        if user_signed_in?
          unless current_user.is_staff?
            flash[:error] = 'Error'
            redirect_to '/'
          end
        else
          flash[:error] = 'Error'
          redirect_to '/'
        end
      end
      begin
        @page = Page.friendly.find('history') unless @year.year == Year.where(reveal_decisions: true).order('year DESC').first.year
      rescue StandardError
        nil
      end
      set_meta_tags title: @application.space.business_name
      render layout: params[:alternate] ? 'alternate' : 'application'
    end
  end

  def year
    @year = Year.includes(applications: :space).find_by(year: params[:year])
    if @year.nil?
      redirect_to('/') && return
    else
      begin
        @page = Page.friendly.find('history') unless @year.year == Year.where(reveal_decisions: true).order('year DESC').first.year
      rescue StandardError
        nil
      end
      if current_user
        @year.reveal_decisions = true if current_user.is_staff?
      end
      respond_to do |format|

        format.html

        format.json { render json: AppSerializer.new(@year.applications.approved_preview.sort_by(&:organisation_name)).serializable_hash.to_json, status: 200 }
      end
    end
  end
end
