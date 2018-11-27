class AddCityToPerformanceapplications < ActiveRecord::Migration
  def change
    add_column :performanceapplications, :city, :string
    add_column :performanceapplications, :country, :string
    add_column :performanceapplications, :assistants_prep, :string
  end
end
