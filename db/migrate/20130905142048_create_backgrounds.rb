# frozen_string_literal: true

class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.string :background_image
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
