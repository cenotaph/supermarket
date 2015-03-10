class Admin::AttendeesController < Admin::BaseController

  has_scope :by_year, default: Year.order(year: :desc).first
  
  def checkin
    @attendee = Attendee.find(params[:id])
    @attendee.toggle!(:arrival_status)
    redirect_to admin_attendees_path
  end
  
  def index
    @attendees = apply_scopes(Attendee).all.order(:last_name, :first_name)
    if params[:by_year]
      @year_scope = params[:by_year]
    end
    set_meta_tags title: 'Professional Preview attendee list'
  end
  
end
