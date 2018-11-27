class Admin::PerformanceapplicationsController < Admin::BaseController
  respond_to :html, :js, :xml, :json, :csv
  has_scope :by_year
  handles_sortable_columns
  
  def comment
    @performanceapplication = Performanceapplication.find(params[:id])
    @performanceapplication.performanceapplicationcomments << Performanceapplicationcomment.new(params[:performanceapplicationcomment].permit([:user_id, :performanceapplication_id, :comment]) )
    if @performanceapplication.save
      flash[:notice] = 'Your comment has been posted.'
    else
      flash[:error] = 'There was an error saving your comment.'
    end
    redirect_to [:admin, @performanceapplication]
  end
  
  def index
    order = sortable_column_order do |column, direction|
      case column
      when "id"
        "id #{direction}"
      when "contact_name"
        "LOWER(contact_name) #{direction}"
      when "decision"
        "decision #{direction}"
      when "year"
        "years.year #{direction}"
      else
        "years.year DESC, contact_name"
      end
    end
    if params[:by_year]
      @year_scope = params[:by_year]
    end
    @performanceapplications = apply_scopes(Performanceapplication).includes(:year).order(order).page(params[:page]).per(150)
    set_meta_tags :title => 'Performance applications'
  end
   
  def show
    @performanceapplication = Performanceapplication.find(params[:id])
    set_meta_tags :title => 'Red Spot application: ' + @performanceapplication.try(:contact_name)
  end
  
  
  def toggle_late
    @application = Performanceapplication.find(params[:id])
    @application.toggle(:allow_late)
    @application.save
    redirect_to @application
  end
  
  def update
    update! { admin_performanceapplications_path }
  end
  
  def destroy
    destroy! { admin_performanceapplications_path }
  end
  
  protected
  
  def permitted_params
    params.permit(:performanceapplication => [:decision])
  end

end