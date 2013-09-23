class Admin::ApplicationsController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  has_scope :by_year
  handles_sortable_columns
  
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
    order = sortable_column_order do |column, direction|
      case column
      when "id"
        "id #{direction}"
      when "name"
        "LOWER(organisation_name) #{direction}"
      when "year"
        "years.year #{direction}"
      when "country"
        "exhibitor_country #{direction}"
      when "comments"
        "applicationcomments_count #{direction}"
      when "decision"
        "booth_granted #{direction}"
      when "last_updated"
        "updated_at #{direction}"
      when "red_spot"
        "red_spot #{direction}"
      else
        "years.year DESC"
      end
    end
    
    @applications = apply_scopes(Application).includes(:year).order(order).page(params[:page]).per(70)
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
    update! { admin_applications_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:application => [:booth_granted, :red_spot])
  end

end