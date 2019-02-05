class PnpsController < ApplicationController
  
  def create
    @pnp = Pnp.new(pnp_params)
    if @pnp.save!
      flash[:notice] = 'Thank you for your application. You will hear from us soon.'
      redirect_to '/'
    end
  end
  
  def index
    @page = Page.friendly.find('pnp-application')
  end
  
  def new
    year = Year.find_by(year: params[:year_id])
    if year.nil?
      redirect_to '/pnps' and return
    else
      @pnp = Pnp.new(year: year)
    end
  end
  
  protected
  
  def pnp_params
    params.require(:pnp).permit([:name, :email, :phone_number, :postal_address, :city, :country, :postcode ,
      :organisation, :other_organisations, :others_from_same,:programme_meetings, :programme_party, :programme_discussion,
      :programme_lounge, :programme_exhibitions, :programme_exhibitors, :programme_talks, :programme_performances,
      :hope_newpartners, :delivering_talk, :writing_about_supermarket, :vegetable, :hope_newknowledge, :hope_othercountries, :hope_exhibitionpossibilities,
      :hope_supermarketoverall, :role_in_scene,:languages, :willing_to_do_survey, :planning_to_write,
      :other_comments, :year_id])
    end
end
