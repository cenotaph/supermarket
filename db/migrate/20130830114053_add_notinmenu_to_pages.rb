class AddNotinmenuToPages < ActiveRecord::Migration
  def change
    add_column :pages, :not_in_menu, :boolean
  end
end
