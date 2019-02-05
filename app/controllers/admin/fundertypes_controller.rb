# frozen_string_literal: true

# funder types. Allow grouping of funders into types for easier display
class Admin::FundertypesController < Admin::BaseController

  def create
    @fundertype = Fundertype.new(fundertype_params)
    if @fundertype.save
      flash[:notice] = 'Saved.'
      redirect_to admin_fundertypes_path
    else
      flash[:error] = 'Error saving press link: ' + @fundertype.errors.full_messages.join('; ')
    end
  end

  def index
    @fundertypes = Fundertype.order(sort_order: :asc)
  end

  def edit
    @fundertype = Fundertype.find(params[:id])
  end

  def destroy
    @fundertype = Fundertype.find(params[:id])
    @fundertype.destroy!
    flash[:notice] = 'Fundertype deleted.'
    redirect_to admin_fundertypes_path    
  end

  def update
    @fundertype = Fundertype.find(params[:id])
    if @fundertype.update(fundertype_params)
      flash[:notice] = 'Fundertype updated.'
      redirect_to admin_fundertypes_url
    else
      flash[:error] = 'Error saving fundertype: ' + @fundertype.errors.full_messages
    end
  end

  def new
    @fundertype = Fundertype.new(fundertypeed_by_id: current_user.id)
  end


  protected

  def fundertype_params
    params.require(:fundertype).permit(:logo, :name, :sort_order, :url, :fundertypetype_id, :sortorder, year_ids: [])
  end
end
