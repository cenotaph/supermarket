class ExhibitorsController < ApplicationController
  
  def index
    @year = Year.find_by(:year => params[:year])
  end
  
end