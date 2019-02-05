class ExhibitorsController < ApplicationController
  
  def show
    @year = Year.find_by(:year => params[:year])
    if @year.nil?
      redirect_to '/' and return
    else
      @application = Application.find_by(:space => Space.friendly.find(params[:space]), :year => @year)
      if @application.nil?
        flash[:error] = 'No such application.'
        redirect_to '/' and return
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
      @page = Page.friendly.find('history') unless @year.year == Year.where(:reveal_decisions => true).order("year DESC").first.year rescue nil
      set_meta_tags title: @application.space.business_name
    end
  end
  
  def year
    @year = Year.includes(:applications => :space).find_by(:year => params[:year])
    if @year.nil?
      redirect_to '/' and return
    else
      @page = Page.friendly.find('history') unless @year.year == Year.where(:reveal_decisions => true).order("year DESC").first.year rescue nil
      if current_user
        if current_user.is_staff?
          @year.reveal_decisions = true
        end
      end
    end
  end
  
end