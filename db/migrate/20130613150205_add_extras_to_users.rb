# frozen_string_literal: true

class AddExtrasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezone, :string
    add_column :users, :display_name, :string
  end
end
