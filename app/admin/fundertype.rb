ActiveAdmin.register Fundertype do
  
 
  
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
      params.permit(:fundertype => [:name])
    end

  end
  
  
end
