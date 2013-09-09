class Admin::ApplicationsController < Admin::BaseController

  has_scope :by_year

  def index
    @applications = apply_scopes(Application).page(params[:page]).per(100)
  end
    
end