class AddPostcodeToPerformanceapplications < ActiveRecord::Migration[5.2]
  def change
    add_column :performanceapplications, :postcode, :string
    add_column :performanceapplications, :postal_address, :string
  end
end
