class AddMoreToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :supermarket_proposal, :text
    add_column :applications, :booth_applied, :integer
    add_column :applications, :booth_granted, :integer
  end
end
