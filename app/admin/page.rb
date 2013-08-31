ActiveAdmin.register Page do
  form :partial => 'form'
  
  index do
    column "Name" do |x|
      link_to x.name, page_path(x)
    end
    column "Sites" do |x|
      x.subsites.map(&:name).join(', ')
    end
    if can? :manage, Page
      column do |x|
        link_to 'edit', edit_admin_page_path(x)
      end

      column do |x|
        link_to 'delete', [:admin, x], :method => :delete, :data => {:confirm => "Are you sure?" }
      end
    end
  end
  
  controller do
    
    def create
      create! do |format|
        format.html { redirect_to admin_pages_path  }
      end
    end
    
    def edit
      @page = Page.friendly.find(params[:id])
    end
    
    def update
      @page = Page.friendly.find(params[:id])
      update! do |format|
        format.html { redirect_to admin_pages_path }
      end
    end
    
    def show
      @page = Page.friendly.find(params[:id])
    end
          
    def permitted_params
      params.permit(:page => [:published, :parent_id , :not_in_menu,  :postimage, :show_postimage_on_page, :show_on_bottom,
        subsite_ids: [], 
        translations_attributes: [:locale, :id, :title, :body] ]) 
    end

  end
end
