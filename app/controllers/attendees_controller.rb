# frozen_string_literal: true

class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      AttendeeMailer.preview_registration(@attendee).deliver
      flash[:notice] = 'Thank you for registering for the professional preview.'
      redirect_to "/preview/#{@attendee.year.year}"
    else
      flash[:error] = 'There was an error saving your registration.'
      render template: 'attendees/preview'
    end
  end

  def preview
    @year = Year.find_by year: params[:id]
    if @year.nil?
      redirect_to '/'
    else
      if !@year.preview_open?
        render template: 'attendees/closed'
      else
        @attendee = Attendee.new(year: @year)
        render
      end
    end
  end

  protected

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :year_id, :organisation, :email)
  end
end
