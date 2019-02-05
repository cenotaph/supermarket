# frozen_string_literal: true

class AddMalongenToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :apply_to_malongen, :boolean
    add_column :applications, :malongen_use, :text
  end
end
