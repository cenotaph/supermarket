class AddSupermarketForumToPnps < ActiveRecord::Migration[5.2]
  def change
    add_column :pnps, :supermarket_forum, :boolean
    add_column :pnps, :hope_newcollabs, :boolean
    add_column :pnps, :other_role_explanation, :string
  end
end
