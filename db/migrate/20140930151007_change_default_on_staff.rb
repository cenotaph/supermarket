# frozen_string_literal: true

class ChangeDefaultOnStaff < ActiveRecord::Migration
  def change
    change_column :applications, :staff, :text, default: "Please fill in suitable titles for these roles, if appropriate, and delete the rest of the text.\n\nMembers: If you have more than 20 members, just write the number of members.\nBoard:\nCo-directors:\nManagers:\nCo-founders:\n!\n"
  end
end
