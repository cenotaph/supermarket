# frozen_string_literal: true

class AddAllowEditingToYear < ActiveRecord::Migration
  def change
    add_column :years, :allow_editing, :boolean, default: false, null: false
  end
end
