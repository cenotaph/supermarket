# frozen_string_literal: true

class Admin::PressreleasesController < Admin::BaseController
  
  def create
    @pressrelease = Pressrelease.new(pressrelease_params)
    if @pressrelease.save
      flash[:notice] = 'Saved.'
      redirect_to admin_pressreleases_path
    else
      flash[:error] = 'Error saving pressrelease: ' + @pressrelease.errors.full_messages.join('; ')
    end
  end

  def index
    @pressreleases = Pressrelease.order(date_of_release: :desc)
  end

  def edit
    @pressrelease = Pressrelease.find(params[:id])
  end

  def destroy
    @pressrelease = Pressrelease.find(params[:id])
    @pressrelease.destroy!
    flash[:notice] = 'Pressrelease deleted.'
    redirect_to admin_pressreleases_path    
  end

  def update
    @pressrelease = Pressrelease.find(params[:id])
    if @pressrelease.update(pressrelease_params)
      flash[:notice] = 'Pressrelease updated.'
      redirect_to admin_pressreleases_url
    else
      flash[:error] = 'Error saving pressrelease: ' + @pressrelease.errors.full_messages
    end
  end

  def new
    @pressrelease = Pressrelease.new(pressreleaseed_by_id: current_user.id)
  end

  protected

  def pressrelease_params
    params.require(:pressrelease).permit %i[title description subsite_id attachment_eng attachment_swe image published date_of_release remove_attachment_eng remove_attachment_swe remove_image year_id]
  end
end
