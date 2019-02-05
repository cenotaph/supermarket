# frozen_string_literal: true

class RemoveUseridFromSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :user_id
  end
end
