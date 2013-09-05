ActiveAdmin.register Background do

  form do |f|
    f.inputs "Background image" do
      f.input :background_image
      f.input :name, :label => "Name" , :hint => "A short name for this image for your own reference"
      f.input :published, :as => :boolean
    end
    f.actions
  end
  
  controller do
    def permitted_params
      params.permit(:background => [:background_image, :name, :published])
    end
  end
end
