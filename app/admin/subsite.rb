ActiveAdmin.register Subsite do

  
  controller do
    def create
      create! { admin_subsites_path }
    end
    def permitted_params
      params.permit(:subsite => [:name, :subdomain])
    end
  end
  
end
