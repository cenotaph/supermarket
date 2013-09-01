class SearchController < ApplicationController

  def index
    @searchterm = params[:searchterm]
  end
  
end
