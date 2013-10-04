class Admin::FundersController < Admin::BaseController

  def create
    create! { admin_funders_path }
  end
  
  def destroy
    destroy! { admin_funders_path }
  end
  
  def update
    update! { admin_funders_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:funder => [:logo, :name, :url, :fundertype_id, :sortorder])
  end
  
end
