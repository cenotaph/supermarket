# frozen_string_literal: true

class AddGuestofToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :guest_of, :string
  end
end
