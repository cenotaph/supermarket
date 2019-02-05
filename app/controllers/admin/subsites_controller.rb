# frozen_string_literal: true

class Admin::SubsitesController < Admin::BaseController
  def create
    @ss = Subsite.new(params[:subsite].permit(%i[name subdomain]))
    redirect_to admin_subsites_path if @ss.save
  end

  def edit
    @ss = Subsite.find(params[:id])
  end

  def new
    @ss = Subsite.new
  end

  def update
    @ss = Subsite.find(params[:id])
    if @ss.update_attributes(params[:subsite].permit(%i[name subdomain]))
      redirect_to admin_subsites_path
    end
  end

  protected

  def permitted_params
    params.permit(subsite: %i[name subdomain])
  end
end
