class AddSourceToPresslinks < ActiveRecord::Migration
  def change
    add_column :presslinks, :source, :string
  end
end
