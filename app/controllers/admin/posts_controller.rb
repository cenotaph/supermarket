class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def set_post
    @post = Post.friendly.find(params[:id])
  end
  
  def create
    create! { admin_posts_path }
  end
  
  def destroy
    destroy! { admin_posts_path }
  end
  
  def update
    update! { admin_posts_path }
  end
  
  def new
    @post = Post.new(:posted_by_id => current_user.id)
  end
  
  protected
  
  def permitted_params 
    params.permit(:post => [:published, :subsite_id, :promoted, :post_as_supermarket, :last_edited_by_id,  :postimage, :slug, :published_at, :posted_by_id, :dont_show_image,
      translations_attributes: [:locale, :id, :subject, :body],
      postslides_attributes: [:id, :caption, :credit, :image, :_destroy] ]) 
  end   
end
