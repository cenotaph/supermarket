class AddSpecialNeedsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :special_needs, :text
    add_column :applications, :need_darker_room, :boolean
    add_column :applications, :wants_open_structure, :boolean
  end
end
