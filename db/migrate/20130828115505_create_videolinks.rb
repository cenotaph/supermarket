class CreateVideolinks < ActiveRecord::Migration
  def change
    create_table :videolinks do |t|
      t.text :url
      t.references :application, index: true
      t.string :video_provider
      t.text :title
      t.string :sortorder
      
      t.timestamps
    end
  end
end
