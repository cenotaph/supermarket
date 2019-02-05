# frozen_string_literal: true

class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.references :application, index: true

      t.timestamps
    end
  end
end
