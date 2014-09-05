class Admin::OrganisationtypesController < Admin::BaseController
  def create
    create! { admin_organisationtypes_path }
  end
  
  def update
    update! { admin_organisationtypes_path}
  end
  protected
  
  def permitted_params
    params.permit(:organisationtype => [translations_attributes: [:locale, :id, :name] ])
  end
  
end