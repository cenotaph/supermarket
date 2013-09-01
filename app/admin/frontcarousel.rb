ActiveAdmin.register Frontcarousel do

  index do
    div "image" do
      image_tag x.image.url(:sidebar)
    end
    div "title" do |x|
      x.title
    end
  end
  controller do
    
    def create
      create! do |format|
        format.html { redirect_to admin_frontcarousels_path  }
      end
    end
    
    def edit
      @frontcarousel = Frontcarousel.find(params[:id])
    end
    
    def update
      @frontcarousel = Frontcarousel.find(params[:id])
      update! do |format|
        format.html { redirect_to admin_frontcarousels_path }
      end
    end
    
    def show
      @frontcarousel = Frontcarousel.friendly.find(params[:id])
    end
          
    def permitted_params
      params.permit(:frontcarousel => [:published, :title, :caption, :link_to, :subsite_id, :image, :customcss  ]) 
    end

  end
  
end
