class Admin::FundertypesController < Admin::BaseController

  def create
    create! { admin_fundertypes_path }
  end
  
  def destroy
    destroy! { admin_fundertypes_path }
  end
  
  def update
    update! { admin_fundertypes_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:fundertype => [:logo, :name, :sort_order, :url, :fundertypetype_id, :sortorder, year_ids: [] ])
  end
  
end
