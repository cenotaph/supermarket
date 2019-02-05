# frozen_string_literal: true

class CreatePresslinks < ActiveRecord::Migration
  def change
    create_table :presslinks do |t|
      t.string :title
      t.string :country
      t.string :url
      t.date :date_of_press
      t.string :attachment
      t.references :year, index: true
      t.references :subsite, index: true

      t.timestamps
    end
  end
end
