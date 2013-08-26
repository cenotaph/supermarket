class AddStatusToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :status, :string
    add_column :applications, :status, :string
  end
end
