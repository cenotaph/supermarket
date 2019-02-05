# frozen_string_literal: true

class AddUserToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :user_id, :integer
    add_column :applications, :space_id, :integer
  end
end
