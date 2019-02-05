# frozen_string_literal: true

class CreateFrontcarousels < ActiveRecord::Migration
  def change
    create_table :frontcarousels do |t|
      t.string :image
      t.boolean :published
      t.string :link_to
      t.string :title
      t.string :caption
      t.text :customcss

      t.timestamps
    end
  end
end
