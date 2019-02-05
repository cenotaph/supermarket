# frozen_string_literal: true

class AddAllowLateToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :allow_late, :boolean, default: false, null: false
  end
end
