# frozen_string_literal: true

class AddNotifiedToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :notified_of_decision, :datetime
  end
end
