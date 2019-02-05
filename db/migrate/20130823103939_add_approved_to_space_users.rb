# frozen_string_literal: true

class AddApprovedToSpaceUsers < ActiveRecord::Migration
  def change
    add_column :space_users, :approved, :boolean, default: false
    execute('UPDATE space_users SET approved = true')
  end
end
