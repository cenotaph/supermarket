# frozen_string_literal: true

class AddNetworkingOnlyToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :networking_only, :boolean, null: false, default: false
  end
end
