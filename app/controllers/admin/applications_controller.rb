class Admin::ApplicationsController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  has_scope :by_year, :default => 1

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
    @applications = apply_scopes(Application).page(params[:page]).per(100)
    # if params[:nomalongen] == "1"
    #   @nomalongen = true
    # end
  end
   

  
end