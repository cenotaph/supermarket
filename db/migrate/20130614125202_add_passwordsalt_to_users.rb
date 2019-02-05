# frozen_string_literal: true

class AddPasswordsaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :string
  end
end
