# frozen_string_literal: true

class CreateApplicationlinks < ActiveRecord::Migration
  def change
    create_table :applicationlinks do |t|
      t.string :url
      t.text :title
      t.references :application, index: true

      t.timestamps
    end
  end
end
