class ExhibitorsController < ApplicationController
  
  def year
    @year = Year.includes(:applications => :space).find_by(:year => params[:year])
    @page = Page.friendly.find('history') rescue nil
  end
  
end