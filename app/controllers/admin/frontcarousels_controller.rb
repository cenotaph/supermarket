# frozen_string_literal: true

class Admin::FrontcarouselsController < Admin::BaseController

  def create
    @frontcarousel = Frontcarousel.new(frontcarousel_params)
    if @frontcarousel.save
      flash[:notice] = 'Saved.'
      redirect_to admin_frontcarousels_path
    else
      flash[:error] = 'Error saving carousel: ' + @frontcarousel.errors.full_messages.join('; ')
    end
  end

  def index
    @frontcarousels = Frontcarousel.order(published: :desc)
  end

  def edit
    @frontcarousel = Frontcarousel.find(params[:id])
  end

  def destroy
    @frontcarousel = Frontcarousel.find(params[:id])
    @frontcarousel.destroy!
    flash[:notice] = 'Frontcarousel deleted.'
    redirect_to admin_frontcarousels_path    
  end

  def update
    @frontcarousel = Frontcarousel.find(params[:id])
    if @frontcarousel.update(frontcarousel_params)
      flash[:notice] = 'Frontcarousel updated.'
      redirect_to admin_frontcarousels_url
    else
      flash[:error] = 'Error saving frontcarousel: ' + @frontcarousel.errors.full_messages
    end
  end

  def new
    @frontcarousel = Frontcarousel.new
  end

  protected

  def frontcarousel_params
    params.require(:frontcarousel).permit %i[image published link_to title caption customcss subsite_id]
  end
end
