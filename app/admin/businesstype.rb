ActiveAdmin.register Businesstype do
  
  form :partial => 'form'
   
  index do
    column "Name" do |x|
      link_to x.name, page_path(x)
    end
    if can? :manage, Businesstype
      column do |x|
        link_to 'edit', edit_admin_businesstype_path(x)
      end

      column do |x|
        link_to 'delete', [:admin, x], :method => :delete, :data => {:confirm => "Are you sure?" }
      end
    end
  end
  
  controller do
    def permitted_params
      params.permit(:businesstype => [
                                        translations_attributes: [:locale, :id, :name] ]) 
    end
  end
  
end
