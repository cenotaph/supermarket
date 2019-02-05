# frozen_string_literal: true

class AddText2018ToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :text_2018, :text
  end
end
