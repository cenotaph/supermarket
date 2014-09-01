class AddTimestampsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :created_at, :datetime
    add_column :spaces, :updated_at, :datetime
  end
end
