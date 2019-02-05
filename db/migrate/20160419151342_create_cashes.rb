# frozen_string_literal: true

class CreateCashes < ActiveRecord::Migration
  def change
    create_table :cashes do |t|
      t.text :title
      t.string :image
      t.integer :image_size, length: 8
      t.integer :image_width
      t.integer :image_height
      t.string :image_content_type
      t.string :source
      t.string :link_url
      t.text :content
      t.integer :order
      t.string :sourceid
      t.integer :issued_at, length: 8

      t.timestamps null: false
    end
  end
end
