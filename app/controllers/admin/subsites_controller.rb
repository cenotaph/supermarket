class Admin::SubsitesController < Admin::BaseController
  
  def create
    @ss = Subsite.new(params[:subsite].permit([:name, :subdomain]))
    if @ss.save
      redirect_to admin_subsites_path
    end
  end
  
  
  def edit
    @ss = Subsite.find(params[:id])
  end
  
  def new
    @ss = Subsite.new
  end
  
  def update
    @ss = Subsite.find(params[:id])
    if @ss.update_attributes(params[:subsite].permit([:name, :subdomain]))
      redirect_to admin_subsites_path
    end
  end
  
  protected
  
  def permitted_params
    params.permit(:subsite => [:name, :subdomain])
  end
end