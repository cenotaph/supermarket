# frozen_string_literal: true

class AddAcceptingNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :accepting_name, :string
  end
end
