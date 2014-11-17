class CreatePerformanceapplicationcomments < ActiveRecord::Migration
  def change
    create_table :performanceapplicationcomments do |t|
      t.references :user, index: true
      t.references :app, index: true
      t.text :comment

      t.timestamps
    end
    # add_index :performanceapplicationcomments, :performanceapplication_id, name: "app_id"

  end
end
