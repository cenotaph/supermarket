class CreateSpaceUsers < ActiveRecord::Migration
  def change
    create_table :space_users do |t|
      t.references :space, index: true
      t.references :user, index: true
      t.timestamps
    end
    add_index :space_users, [:space_id, :user_id], unique: true 
  end
end
