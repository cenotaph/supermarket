# frozen_string_literal: true

class AddSlugToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :slug, :string
  end
end
