# frozen_string_literal: true

class AddInterested2016ToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :interested_2016, :boolean
  end
end
