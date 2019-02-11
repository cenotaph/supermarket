class AddInformalCountryToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :informal_country, :string
  end
end
