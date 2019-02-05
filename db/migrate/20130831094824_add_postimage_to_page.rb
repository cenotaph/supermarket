# frozen_string_literal: true

class AddPostimageToPage < ActiveRecord::Migration
  def change
    add_column :pages, :postimage, :string
    add_column :pages, :show_on_bottom, :boolean, default: false, null: false
    add_column :pages, :show_postimage_on_page, :boolean, default: false, null: false
  end
end
