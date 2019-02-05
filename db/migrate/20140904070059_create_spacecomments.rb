# frozen_string_literal: true

class CreateSpacecomments < ActiveRecord::Migration
  def change
    create_table :spacecomments do |t|
      t.references :user, index: true
      t.references :space, index: true
      t.text :comment

      t.timestamps
    end
  end
end
