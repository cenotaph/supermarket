class PagesController < ApplicationController
  
  def show
    @page = Page.friendly.find(params[:id])
    if @page.is_private == true
      authenticate_user!
    end
    unless @page.background.nil?
      @background_image = @page.background
    end
  end
  

end