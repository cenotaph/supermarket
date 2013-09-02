class AddVatToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :vat_number, :string
  end
end
