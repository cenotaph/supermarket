# frozen_string_literal: true

class AddSpaceidToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :space_id, :integer
  end
end
