class ExhibitorsController < ApplicationController
  
  def year
    @year = Year.find_by(:year => params[:year])
  end
  
end