# frozen_string_literal: true

class AddOptionsToYears < ActiveRecord::Migration
  def change
    add_column :years, :header_html, :text
    add_column :years, :footer_html, :text
    add_column :years, :above_carousel_html, :text
    add_column :years, :center_above_carousel_text, :boolean
  end
end
