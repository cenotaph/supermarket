# frozen_string_literal: true

# controller to manage Supermarket TV (videos), not used currently
class Admin::VideosController < Admin::BaseController

  def create
    @video = Video.new(permitted_params[:video])
    respond_to do |format|
      if @video.save
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully created.' }
      else
        format.html do
          @videos = Video.by_subsite(@subsite.id)
          render action: :index
        end
      end
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def index
    @videos = Video.by_subsite(@subsite.id)
    @video ||= Video.new
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      flash[:notice] = 'Video updated.'
      redirect_to admin_videos_url
    else
      flash[:error] = 'Error saving video: ' + @video.errors.full_messages
    end
  end

  protected

  def video_params
    params.require(:video).permit %i[published subsite_id year_id title description thumbnail in_url]
  end
end
