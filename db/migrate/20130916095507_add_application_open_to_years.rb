class AddApplicationOpenToYears < ActiveRecord::Migration
  def change
    add_column :years, :applications_open, :boolean, :null => false, :default => false
  end
end
