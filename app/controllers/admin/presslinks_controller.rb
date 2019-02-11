# frozen_string_literal: true

class Admin::PresslinksController < Admin::BaseController\

  def create
    @presslink = Presslink.new(presslink_params)
    if @presslink.save
      flash[:notice] = 'Saved.'
      redirect_to admin_presslinks_path
    else
      flash[:error] = 'Error saving press link: ' + @presslink.errors.full_messages.join('; ')
    end
  end

  def index
    @presslinks = Presslink.order(date_of_press: :desc)
  end

  def edit
    @presslink = Presslink.find(params[:id])
  end

  def destroy
    @presslink = Presslink.find(params[:id])
    @presslink.destroy!
    flash[:notice] = 'Presslink deleted.'
    redirect_to admin_presslinks_path    
  end

  def update
    @presslink = Presslink.find(params[:id])
    if @presslink.update(presslink_params)
      flash[:notice] = 'Presslink updated.'
      redirect_to admin_presslinks_url
    else
      flash[:error] = 'Error saving presslink: ' + @presslink.errors.full_messages
    end
  end

  def new
    @presslink = Presslink.new
  end

  protected

  def presslink_params
    params.require(:presslink).permit %i[title country subsite_id url year_id date_of_press attachment remove_attachment source country]
  end
end
