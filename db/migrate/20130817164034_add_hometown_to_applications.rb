# frozen_string_literal: true

class AddHometownToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :hometown, :string
    add_column :applications, :application_image, :string
    add_column :applications, :staff, :text, default: "Please pick suitable titles from these alternatives.\n\nMembers: If you have more than 20 members, just write the number of members.\nBoard:\nCo-directors:\nManagers:\nCo-founders:\n! DELETE ALTERNATIVES NOT USED\n"
  end
end
