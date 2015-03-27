class AddSortorderToFundertypes < ActiveRecord::Migration
  def change
    add_column :fundertypes, :sort_order, :float, null: false, default: 0
  end
end
