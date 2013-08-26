class AddContactStateToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :contact_state, :string
    add_column :applications, :exhibitor_state, :string
  end
end
