# frozen_string_literal: true

class CreateApplicationwebimages < ActiveRecord::Migration
  def change
    create_table :applicationwebimages do |t|
      t.string :imagefile
      t.text :title
      t.integer :sortorder
      t.references :application, index: true

      t.timestamps
    end
  end
end
