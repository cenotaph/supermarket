# frozen_string_literal: true

class AddApprovalTokenToSpaceUsers < ActiveRecord::Migration
  def change
    add_column :space_users, :approval_token, :string
    add_index :space_users, :approval_token, unique: true
  end
end
