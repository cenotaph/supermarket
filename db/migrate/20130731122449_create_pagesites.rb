# frozen_string_literal: true

class CreatePagesites < ActiveRecord::Migration
  def change
    create_table :page_sites do |t|
      t.integer :page_id
      t.integer :site_id
    end
    add_index :page_sites, %i[page_id site_id], unique: true
  end
end
