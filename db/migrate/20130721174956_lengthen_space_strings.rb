class LengthenSpaceStrings < ActiveRecord::Migration
  def change
    change_column :spaces, :email, :string
    change_column :spaces, :address1, :string
    change_column :spaces, :address2, :string
    change_column :spaces, :city, :string
    change_column :spaces, :contact_email, :string
    change_column :spaces, :contact_person, :string
    change_column :spaces, :visiting_address1, :string
    change_column :spaces, :visiting_address2, :string
    change_column :spaces, :visiting_city, :string
    change_column :spaces, :other_focus, :string
    change_column :spaces, :country, :string
    change_column :spaces, :visiting_country, :string
  end
end
