ActiveAdmin.register Post do
  form :partial => 'form'
  
  controller do
    
    def create
      create! do |format|
        format.html { redirect_to admin_posts_path  }
      end
    end
    
    def edit
      @post = Post.friendly.find(params[:id])
    end
    
    def update
      @post = Post.friendly.find(params[:id])
      update! do |format|
        format.html { redirect_to admin_posts_path }
      end
    end
    
    def show
      @post = Post.friendly.find(params[:id])
    end
          
    def permitted_params
      params.permit(:post => [:published, :subsite_id, :promoted, :post_as_supermarket, :last_edited_by_id,  :postimage, :slug, :published_at, :posted_by_id, :dont_show_image,
        translations_attributes: [:locale, :id, :subject, :body] ]) 
    end

  end
end
