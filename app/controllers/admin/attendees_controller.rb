class Admin::AttendeesController < Admin::BaseController

  has_scope :by_year, default: Year.order(year: :desc).first
  
  def checkin
    @attendee = Attendee.find(params[:id])
    @attendee.toggle!(:arrival_status)
    if request.xhr?
      respond_to do |format|
        format.js 
      end
    end
  end
  
  def index
    @attendees = apply_scopes(Attendee).all.order(:id, :last_name, :first_name)
    if params[:by_year]
      @year_scope = params[:by_year]
    end
    set_meta_tags title: 'Professional Preview attendee list'
  end
  
  def toggle_vip
    @attendee = Attendee.find(params[:id]) 
    if current_user.has_role? :god
      @attendee.toggle!(:vip)
    end
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
  end
  
end
