class AddDisplaynameToInternallinks < ActiveRecord::Migration
  def change
    add_column :internallinks, :display_name, :string
  end
end
