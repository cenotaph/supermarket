class AddVipToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :vip, :boolean, default: false, null: false
  end
end
