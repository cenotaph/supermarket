class CreateContactdetails < ActiveRecord::Migration
  def change
    create_table :contactdetails do |t|
      t.string :first_name
      t.string :last_name
      t.string :moms
      t.string :contact_phone
      t.string :contact_post_town
      t.string :contact_postal_address
      t.string :contact_postcode
      t.string :country
      t.string :public_email
      t.string :public_phone
      t.string :public_post_town
      t.string :public_postal_address
      t.string :public_postcode

      t.timestamps
    end
  end
end
