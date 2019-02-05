# frozen_string_literal: true

class Admin::FundersController < Admin::BaseController
  def create
    @funder = Funder.new(funder_params)
    if @funder.save
      flash[:notice] = 'Saved.'
      redirect_to admin_funders_path
    else
      flash[:error] = 'Error saving funder: ' + @funder.errors.full_messages.join('; ')
    end
  end

  def edit
    @funder = Funder.find(params[:id])
  end

  def index
    @funders = Funder.all
  end

  def destroy
    @funder = Funder.find(params[:id])
    @funder.destroy!
    flash[:notice] = 'Funder deleted.'
    redirect_to admin_funders_path
  end

  def update
    @funder = Funder.find(params[:id])
    if @funder.update(funder_params)
      flash[:notice] = 'Funder updated.'
      redirect_to admin_funders_url
    else
      flash[:error] = 'Error saving funder: ' + @funder.errors.full_messages
    end
  end

  def new
    @funder = Funder.new(fundered_by_id: current_user.id)
  end

  protected

  def funder_params
    params.require(:funder).permit(:logo, :name, :url, :fundertype_id, :sortorder, year_ids: [])
  end
end
