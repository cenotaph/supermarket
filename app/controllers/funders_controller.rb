class FundersController < InheritedResources::Base
  
  actions :index
  
  def index
    if params[:id]
      @year = Year.find_by(year: params[:id])
    else
      @year = Year.where(:reveal_decisions => true).order("year DESC").first
    end
    
      @allfunders = Fundertype.by_year(@year.year).order(:sort_order).includes(:funders).to_a.delete_if{|x| x.funders.empty? }.uniq
    @background_image = nil
    set_meta_tags title: 'Funders & supporters ' + @year.year.to_s
  end
  
end