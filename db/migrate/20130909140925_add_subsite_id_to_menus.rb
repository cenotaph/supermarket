# frozen_string_literal: true

class AddSubsiteIdToMenus < ActiveRecord::Migration
  def change
    add_reference :menus, :subsite, index: true
    add_column :menus, :level, :integer
  end
end
