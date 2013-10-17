class AddAcceptingNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :accepting_name, :string
  end
end
