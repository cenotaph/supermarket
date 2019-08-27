# frozen_string_literal: true

class Admin::YearsController < Admin::BaseController
  def create
    @year = Year.new(year_params)
    if @year.save
      flash[:notice] = 'Saved.'
      redirect_to admin_years_path
    else
      flash[:error] = 'Error saving year: ' + @year.errors.full_messages.join('; ')
    end
  end

  def new
    @year = Year.new
  end
  def edit
    @year = Year.find(params[:id])
  end
  
  def index
    @years = Year.all.order(:year)
  end

  def update
    @year = Year.find(params[:id])
    if @year.update(year_params)
      flash[:notice] = 'Year updated.'
      redirect_to admin_years_url
    else
      flash[:error] = 'Error saving year: ' + @year.errors.full_messages
    end
  end

  protected

  def year_params
    params.require(:year).permit %i[applications_open reveal_decisions registration_deadline header_html footer_html above_carousel_html center_above_carousel_text allow_editing year tv_description]
  end
end
