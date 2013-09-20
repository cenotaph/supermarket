class Admin::ApplicationsController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  has_scope :by_year

  def comment
    @application = Application.find(params[:id])
    @application.applicationcomments << Applicationcomment.new(params[:applicationcomment].permit([:user_id, :application_id, :comment]) )
    if @application.save
      flash[:notice] = 'Your comment has been posted.'
    else
      flash[:error] = 'There was an error saving your comment.'
    end
    redirect_to @application
  end
  
  def index
    @applications = apply_scopes(Application).includes(:year).order("years.year desc").page(params[:page]).per(70)
    if params[:nomalongen] == "1"
      @nomalongen = true
    end
  end
   
  def toggle_late
    @application = Application.find(params[:id])
    @application.toggle(:allow_late)
    @application.save
    redirect_to @application
  end
  
  def update
    update! { @application }
  end
  
  protected
  
  def permitted_params
    params.permit(:application => [:booth_granted])
  end

end