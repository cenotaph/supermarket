# frozen_string_literal: true

class AddRedSpotToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :red_spot, :boolean
  end
end
