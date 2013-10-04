class FundersController < InheritedResources::Base
  
  actions :index
  
  def index
    @allfunders = Fundertype.all.includes(:funders).delete_if{|x| x.funders.empty? }
  end
  
end