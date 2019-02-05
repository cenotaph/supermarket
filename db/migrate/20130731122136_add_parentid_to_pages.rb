# frozen_string_literal: true

class AddParentidToPages < ActiveRecord::Migration
  def change
    add_column :pages, :parent_id, :integer
  end
end
