class AddDontshowimageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :dont_show_image, :boolean, :default => false, :null => false
  end
end
