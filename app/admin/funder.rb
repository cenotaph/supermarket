ActiveAdmin.register Funder do
  
  form :partial => 'form'
  controller do
    
    def create
      create! do |format|
        format.html { redirect_to admin_fundertypes_path  }
      end
    end
  

    def update
      update! do |format|
        format.html { redirect_to admin_fundertypes_path }
      end
    end
  
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_fundertypes_path }
      end
    end
 
    def permitted_params
      params.permit(:funder => [:logo, :name, :url, :sortorder, :fundertype_id])
    end

  end
  
end
