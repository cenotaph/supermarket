class ExhibitorsController < ApplicationController
  
  def show
    @year = Year.find_by(:year => params[:year])
    @application = Application.find_by(:space => Space.friendly.find(params[:space]), :year => @year)
    if @application.nil?
      flash[:error] = 'No such application.'
      redirect_to '/'
    elsif !@application.approved?
      if user_signed_in?
        if !current_user.is_staff?
          flash[:error] = "Error"
          redirect_to '/'
        end
      else
        flash[:error] = "Error"
        redirect_to '/'
      end
    end
    @page = Page.friendly.find('history') rescue nil
  end
  
  def year
    @year = Year.includes(:applications => :space).find_by(:year => params[:year])
    @page = Page.friendly.find('history') rescue nil
    if current_user
      if current_user.is_staff?
        @year.reveal_decisions = true
      end
    end
  end
  
end