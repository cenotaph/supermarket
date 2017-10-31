class PerformanceapplicationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @performanceapplication = Performanceapplication.new(perfapp_params)
    if @performanceapplication.save
      flash[:notice] = 'Thank you for your application. You will hear from us soon.'
      redirect_to '/'
    else
      flash[:error] = 'There was an error saving your application: ' + @performanceapplication.errors.full_messages.join('; ')
      @year = @performanceapplication.year
      render :template => 'performanceapplications/new'
    end
  end

  def new
    @year = Year.find_by(:year => params[:year])
    @performanceapplication = Performanceapplication.new(:year_id => @year.id, user_id: current_user.id)
    set_meta_tags title: 'Performance programme application'
  end

  protected

  def perfapp_params
    params.require(:performanceapplication).permit([:contact_name, :number_of_assistants, :additional_comments, :user_id, :year_id, :contact_phone, :contact_email, :description, :prep_time, :performance_time, :num_of_participants_on_stage, :number_of_participants_off_stage, :technical_requirements, :weblink1, :weblink2, :weblink3, :weblink4, :connection_to_visual_arts, :attachment])
  end
end
