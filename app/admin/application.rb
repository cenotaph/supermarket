ActiveAdmin.register Application do
  filter :year, :as => :select, :collection => proc { Year.all }
  
  index do
    column :id
    column :year do |a|
      a.year.year
    end
    column :organisation_name
    column :exhibitor_city
    column :exhibitor_country
    actions
  end
end
