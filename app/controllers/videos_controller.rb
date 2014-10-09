class VideosController < InheritedResources::Base
  actions :index
  
  def index
    if params[:year]
      @year = Year.find_by(:year => params[:year])
    else
      @year = Year.where(:reveal_decisions => true).order("year DESC").first
    end
    @years = Year.all.order("year desc").to_a.delete_if{|x| x.videos.published.empty? }
    @videos = []
    #@years.each do |year|
    @videos = Video.published.order('created_at DESC').where("year_id  = ?", @year.id).page(params[:page]).per(6) 
    #end
  end
end