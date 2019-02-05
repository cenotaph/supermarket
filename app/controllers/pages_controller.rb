# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    authenticate_user! if @page.is_private == true
    @background_image = @page.background unless @page.background.nil?
    @nofilters = 1
  end
end
