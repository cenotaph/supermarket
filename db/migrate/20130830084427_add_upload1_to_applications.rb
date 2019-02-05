# frozen_string_literal: true

class AddUpload1ToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :upload1, :string
    add_column :applications, :upload2, :string
  end
end
