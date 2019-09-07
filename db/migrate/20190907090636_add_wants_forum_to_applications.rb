class AddWantsForumToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :wants_forum, :boolean
  end
end
