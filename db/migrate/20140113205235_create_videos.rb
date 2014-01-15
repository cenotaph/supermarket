class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videohosts do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    execute("insert into videohosts (name, description) values ('youtube', 'YouTube'), ('vimeo', 'Vimeo')")
    create_table :videos do |t|
      t.references :subsite, index: true
      t.string :provider_id
      t.boolean :published
      t.references :year, index: true
      t.string :thumbnail
      t.integer :thumbnail_size, :length => 8
      t.integer :thumbnail_width
      t.integer :thumbnail_height
      t.string :thumbnail_content_type
      t.integer :video_width
      t.integer :video_height
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :videohost_id

      t.timestamps
    end
  end
end
