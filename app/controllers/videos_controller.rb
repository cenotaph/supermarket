# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @year = if params[:year]
              Year.find_by(year: params[:year])
            else
              Year.where(reveal_decisions: true).order('year DESC').first
            end
    if @year.nil?
      redirect_to '/'
    else
      @years = Year.all.order('year desc').to_a.delete_if { |x| x.videos.published.empty? }
      @videos = []
      # @years.each do |year|

      @videos = Video.published.order('created_at DESC').where('year_id  = ?', @year.id).page(params[:page]).per(6)
    end
  end
end
