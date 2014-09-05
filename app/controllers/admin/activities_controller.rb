class Admin::ActivitiesController < Admin::BaseController
  def create
    create! { admin_activities_path }
  end
  
  def update
    update! { admin_activities_path}
  end
  protected
  
  def permitted_params
    params.permit(:activity => [translations_attributes: [:locale, :id, :name] ])
  end
  
end