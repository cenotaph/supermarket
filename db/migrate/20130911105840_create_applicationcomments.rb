class CreateApplicationcomments < ActiveRecord::Migration
  def change
    create_table :applicationcomments do |t|
      t.references :user, index: true
      t.references :application, index: true
      t.text :comment

      t.timestamps
    end
  end
end
