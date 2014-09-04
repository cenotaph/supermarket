class AddDeniedToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :denied, :boolean, :null => false, :default => false
    add_column :spaces, :denied_by, :integer
  end
end
