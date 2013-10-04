class AddCustomToInternallinks < ActiveRecord::Migration
  def change
    add_column :internallinks, :custom_url, :string
  end
end
