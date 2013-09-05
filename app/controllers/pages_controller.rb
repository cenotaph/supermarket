class PagesController < ApplicationController
  
  def show
    @page = Page.friendly.find(params[:id])
    unless @page.background.nil?
      @background_image = @page.background
    end
  end
  

end