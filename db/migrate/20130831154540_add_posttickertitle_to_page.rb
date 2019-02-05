# frozen_string_literal: true

class AddPosttickertitleToPage < ActiveRecord::Migration
  def change
    add_column :pages, :postticker_title, :string
  end
end
