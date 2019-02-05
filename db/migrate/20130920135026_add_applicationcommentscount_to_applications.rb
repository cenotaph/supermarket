# frozen_string_literal: true

class AddApplicationcommentscountToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :applicationcomments_count, :integer, default: 0

    Application.reset_column_information
    Application.all.each do |a|
      Application.update_counters a.id, applicationcomments_count: a.applicationcomments.size
    end
  end

  def self.down
    remove_column :applications, :applicationcomments_count
  end
end
