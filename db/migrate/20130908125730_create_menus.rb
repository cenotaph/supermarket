# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :item_type
      t.integer :item_id
      t.integer :sort_order
      t.integer :parent_id
      t.boolean :published

      t.timestamps
    end
  end
end
