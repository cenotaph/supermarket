class AddSubmittedAtToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :submitted_at, :date
    execute('update applications set submitted_at = created_at')
  
  end
end
