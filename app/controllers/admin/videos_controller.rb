class Admin::VideosController < Admin::BaseController
  
  def create 
    @video = Video.new(permitted_params[:video])
     respond_to do |format|
       if @video.save
         format.html { redirect_to admin_videos_url, notice: 'Video was successfully created.' }
       else
         format.html { 
           @videos = Video.by_subsite(@subsite.id)
           render action: :index 
         }
       end
     end
  end
  
  def index
    @videos = Video.by_subsite(@subsite.id)
    @video = Video.new unless @video
  end
  
  def update
    update! { admin_videos_path }
  end
  
  protected
  
  def permitted_params 
    params.permit(:video => [:published, :subsite_id, :year_id, :title, :description, :thumbnail, :in_url])
  end   
  
end