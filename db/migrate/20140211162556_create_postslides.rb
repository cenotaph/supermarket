class CreatePostslides < ActiveRecord::Migration
  def change
    create_table :postslides do |t|
      t.string :image
      t.integer :image_size, length: 8
      t.integer :image_width
      t.integer :image_height
      t.string :image_content_type
      t.string :caption
      t.string :credit
      t.references :post, index: true

      t.timestamps
    end
  end
end
